Pkg.update()

packages = [
	    "Distributions"
	    "Plots"
	    "PyPlot"
	    ]
for package in packages
	Pkg.add(package)
end
