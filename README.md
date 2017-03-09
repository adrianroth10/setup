# Setting up Ubuntu 14.04
Scripts to run for setting up various programs on an ubuntu machine
The background music have been provided by http://www.bensound.com

## Demo
![](demo.gif)

## Available scripts
* vim.sh 
  - Will overwrite your current .vimrc file if any exists
* sdl.sh 
* bashrc.sh 
  - Adding some useful aliases and exports to .bashrc
* latex.sh 
* spotify.sh 
* java.sh 
* google_chrome.sh 
* opencv.sh 
  - Currently has a bug where the sudo password must be written twice
* curl.sh 
* julia.sh 
* R.sh 
* python.sh 
* mysql.sh 


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
The input file also handles packages to be installed using the package manager. Just write the name as you would after for example `sudo apt-get install`

For further information try `./setup.sh -h`