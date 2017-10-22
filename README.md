# Setting up Ubuntu 14.04
Scripts to run for setting up various programs on an ubuntu machine
The background music have been provided by http://www.bensound.com

## Demo
![](demo.gif)

## Available scripts
* curl.sh 
* bashrc.sh 
  - Adding some useful aliases and exports to .bashrc
* sdl.sh 
* geant4.sh 
* iphone.sh 
* mutt.sh 
  - Only works for gmail accounts
  - Encrypts your password using gpg in file ~/.password for your account
* spotify.sh 
* java.sh 
* root_cern.sh 
* julia.sh 
* latex.sh 
* google_chrome.sh 
* keepassx2.sh 
  - Following: http://ubuntuhandbook.org/index.php/2015/12/install-keepassx-2-0-in-ubuntu-16-04-15-10-14-04/
* vim.sh 
  - Will overwrite your current .vimrc file if any exists
* python.sh 
* R.sh 
* opencv.sh 
  - Currently has a bug where the sudo password must be written twice
* mysql.sh 
* haskell.sh 
  - Installing the haskell, this means haskell stack, cabal and haste
* ruby.sh 


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