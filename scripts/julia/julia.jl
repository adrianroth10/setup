Pkg.init()
Pkg.update()

packages = [
	    "Distributions"
	    "Interpolations"
	    "MAT"
	    "Plots"
	    "PyPlot"
	    ]
for package in packages
	Pkg.add(package)
end
