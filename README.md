# Setting up Ubuntu 14.04
Scripts to run for setting up various programs on an ubuntu machine

  * Do not use `git clone`, use `git_clone_or_pull` instead found in `functions.sh`. Example of how it can be used in `scripts/vim.sh`

## TODO 
  * programs to add
    - rubyrails
    - mysql
  * file should only be able to run once if multiple scripts are calling eachother
  * currently julia and opencv are just not run again if they are installed. If the source is updated it should be run again so a combine with if git pull and run make only if an update was pulled.
  * The outputs of sudo password and cvlc is fucking shit up!
  * Add stopwatch for each installation so it says how long each installation takes
