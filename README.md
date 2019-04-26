# Setting up Ubuntu 14.04
Scripts to run for setting up various programs on an ubuntu machine
The background music have been provided by http://www.bensound.com

## Demo
![](demo.gif)

## Available scripts
* android-file-transfer.sh 
* mitsuba.sh 
  - Currently not working
* latex.sh 
* spotify.sh 
* zsh.sh 
  - Adding some useful aliases and exports to .bashrc
* R.sh 
* srim.sh 
* vim.sh 
  - Will overwrite your current .vimrc file if any exists
* vim_anton.sh 
  - Will overwrite your current .vimrc file if any exists
* mendeley.sh 
* adobereader.sh 
* firefox-esr.sh 
  - Installing the extended support release
* opencv.sh 
  - Verbose
* ruby.sh 
  - Includes ruby function for inlining css in html
* skype.sh 
* inkscape.sh 
* pyne.sh 
* mysql.sh 
  - Verbose
* okular.sh 
* python.sh 
  - Python 3 with basic packages
* julia.sh 
* bear.sh 
* sdl.sh 
* go4_gsi.sh 
* compiz.sh 
  - Window manager on linux
* docker.sh 
* haskell.sh 
  - Installing the haskell, this means haskell stack, cabal and haste compiler (v 0.5.5.1)
* curl.sh 
* keepassx2.sh 
* cuda.sh 
  - Installation of the cuda drivers
  - NOT WORKING
* gnuplot.sh 
* google_chrome.sh 
* pandoc.sh 
* java.sh 
  - Verbose
* bashrc.sh 
  - Adding some useful aliases and exports to .bashrc
* anaconda.sh 
* geant4.sh 
  - Currently has a bug where the sudo password must be written twice
* root_cern.sh 
  - VERSION="v6-04-18"
* for_pyne.sh 
* apache.sh 
  - Installing the apache server with php compatability
* mutt.sh 
  - Verbose
  - Uses mutt-wizard for installation
* yaml_cpp.sh 

Verbose means that the script needs input from the command line and can't be piped to log file.



## Examples
To install all scripts just run `./setup.sh`
Then to run a subset of the scripts in a certain order declared in `file` run either
```
./setup.sh file
```
or
```
./setup.sh -i file
```
The input file can also handle packages to be installed using the package manager. Just write the name as you would after for example `sudo apt-get install`

For further information try `./setup.sh -h`