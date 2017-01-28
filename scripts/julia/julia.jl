Pkg.init()
Pkg.update()

packages = [
	    "Distributions"
	    "MAT"
	    "Plots"
	    "PyPlot"
	    ]
for package in packages
	Pkg.add(package)
end
