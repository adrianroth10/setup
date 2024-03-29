#! /usr/bin/env python3
#
# A Python reimplementation of BEAMERSCAPE Export Overlays
# Originally written by Jonathan Bohren
# Rewrite by Matthias Ellmer
#
# About
#   This script will export the layers from an inkscape svg file into a
#   directory with the same basename as the .svg file. The layers will be
#   exported in pdf format to preserve transparency.
#   
#   For more info, see:
#     https://github.com/jbohren/beamerscape
# 
# LICENSING: TODO
# Temporary license text, valid until the status of this project is determined:
# License
#   Copyright (c) 2013, Jonathan Bohren (jonathan.bohren@gmail.com)
#   All rights reserved.
#  
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the beamerscape project nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#  
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#   DISCLAIMED. IN NO EVENT SHALL JONATHAN BOHREN BE LIABLE FOR ANY
#   DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#   ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import argparse
import xml.etree.ElementTree
import subprocess
import os
import re


descText = 'Convert Inkscape SVGs for use in latex.'
epilogText = r'''
Notes:
    
The program creates one folder with the basename of each FILE in PATH.
Inside this folder, a latex file <overlay.tex> is created. Use this file with
\subimport{<PATH TO OUTDIR>/<FILE WITHOUT SVG>/}{overlay.tex}
eg. the command 
\subimport{beamerScapeSvgExample/}{overlay.tex}
Note the final slash in the path argument. It is important that you use
subimport from the "import" package, as otherwise the path to the included
pdf files is not resolved properly. The generated files make use of the
textpos package. You should add
\usepackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}
\textblockorigin{0mm}{0mm}
to your preamble to avoid errors with overfull boxes.
The included pdfs will most likely generate a warning regarding pdf page
groups. Suppress this warning by including
\pdfsuppresswarningpagegroup=1
in your preamble.
'''

# Input processing
parser = argparse.ArgumentParser(description=descText, epilog=epilogText,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
parser.add_argument('--tex', action='store_true',  default=False,
                    help='use inkscape --export-latex option')
parser.add_argument('--outdir', metavar='PATH', type=str, nargs='?', default='',
                    help="""the path in which one folder with the overlays
                    for each file is created. Default is directory of svg file""")
parser.add_argument('files', metavar='FILE', nargs='+', type=str,
                    help='svg files to be processed')
args = parser.parse_args()

# Patterns
overlayPattern = re.compile('^<(.*)>')
beginPicturePattern = re.compile('begin{picture}')
endPicturePattern = re.compile('end{picture}')

# Proces files
for file in args.files:
    with open(file) as handle:
        if args.outdir != '':
            baseName = os.path.basename(os.path.splitext(file)[0])
            outPath = os.path.join(args.outdir, baseName)
        else: #default
            baseName = os.path.basename(os.path.splitext(file)[0])
            outPath = os.path.join(os.path.dirname(file), baseName)
        overlayFile = os.path.join(outPath, "overlay.tex")

        # Get layers from SVG
        svgRoot = xml.etree.ElementTree.fromstring(handle.read())
        svgLayers = svgRoot.findall('{http://www.w3.org/2000/svg}g')

        if not len(svgLayers):
            print("No layers found in " + file)
            continue

        texFiles = []
        overlays = []
        pdfs = []
        
        # Extract ids, overlay specs, and export pdfs
        for layer in svgLayers:
            layerLabel = layer.get(
                '{http://www.inkscape.org/namespaces/inkscape}label')
            layerId = layer.get('id')
            layerStyle = layer.get('style')
            if layerStyle == 'display:none':
                continue
            
            overlaySpec = overlayPattern.findall(layerLabel)
            if not len(overlaySpec):
                overlaySpec.append('+-')

            outFilePdf = os.path.join(
                outPath, "{}_{}.pdf".format(baseName, layerId))
            outFileTex = os.path.join(
                outPath, "{}_{}.pdf_tex".format(baseName, layerId))

            # Call inkscape and write layer
            os.makedirs(outPath, exist_ok=True)
            cmd = ["inkscape", file, "-z", "-C",
                   "-j", "-i", layerId, "-A", outFilePdf]

            if args.tex:
                cmd.append("--export-latex")

            subprocess.run(cmd)         

            # Needed when parsing all generated files
            texFiles.append(outFileTex)
            overlays.append(overlaySpec)
            pdfs.append(outFilePdf)

        latexText = []
        if args.tex:
            # Each generated latex file defines its own picture environment.
            # Including these files sequentially in your main tex file will
            # lead to transparency not working, defeating the purpose of this
            # project. The strategy is to extract the picture environments from
            # all files and concatenate their content. This is written to a new
            # tex file further down.
            heads = []
            bodies = []
            tails = []
            for texFile in texFiles:
                with open(texFile) as tFile:
                    tex = tFile.read().splitlines()
                    beginLineNum = 0
                    endLineNum = 0
                    for num, line in enumerate(tex):
                        if beginPicturePattern.search(line):
                            beginLineNum = num
                            continue
                        if endPicturePattern.search(line):
                            endLineNum = num
                            break
                    heads.append(tex[:beginLineNum+1])
                    bodies.append(tex[beginLineNum+1:endLineNum])
                    tails.append(tex[endLineNum:])

            # Create final tex file, concatenate all picture environments
            # with respective overlay specifications for each layer.
            # Structure is something like:
            #  - preamble
            #  - begin{textblock}
            #  - begin{picture}
            #  - overlay1...overlayN
            #  - end{picture}
            #  - end{textblock}
            # Textblocks are used to align to page

            latexText = heads[0]

            # Insert before begin{picture}
            latexText.insert(len(latexText)-1,
                               "\\begin{textblock}{1}(0,0)")

            for num, body in enumerate(bodies):
                if len(overlays[num]):
                    latexText.append("\only<{}>{{".format(overlays[num][0]))
                    latexText.extend(body)
                    latexText.append("}")
                else:
                    latexText.extend(body)
            latexText.extend(tails[-1])

            # Insert after end{picture}
            latexText.insert(len(latexText)-1, "  \\end{textblock}")

            # remove intermediate files
            for f in texFiles:
                os.remove(f)

        else:  # !args.tex
            # Everything is easier for non-latex rendered pfds. Just include
            # all pdfs from all overlays directly.
            for overlay, pdf in zip(overlays, pdfs):
                name = os.path.splitext(pdf)[0]
                latexText.append("\\only<{}>{{".format(overlay[0]))
                latexText.append("  \\begin{textblock}{1}(0,0)")
                latexText.append("    \\includegraphics[height=\paperheight]{{{}}}".format(name))
                latexText.append("  \\end{textblock}")
                latexText.append("}")

        with open(overlayFile, 'w') as out:
            for line in latexText:
                out.write(line + os.linesep)

        # Done
print("Generated " + overlayFile)
