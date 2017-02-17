Pkg.init()
Pkg.update()

packages = [
	    "Distributions"
	    "Interpolations"
	    "MAT"
	    "Plots"
	    "ProfileView"
	    "PyPlot"
	    ]
for package in packages
	Pkg.add(package)
end
