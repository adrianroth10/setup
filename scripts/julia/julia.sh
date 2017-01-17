#!/bin/bash
sudo apt-get install -y libssl0.9.8
git clone git://github.com/JuliaLang/julia.git ~/.julia
cd ~/.julia
git checkout release-0.5
make
make testall

julia julia.jl
