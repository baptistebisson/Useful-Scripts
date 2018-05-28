# Useful-Scripts
Some simple and useful bash scripts

## Install

* `git clone https://github.com/baptistebisson/Useful-Scripts.git`
* `vim ~/.bashrc` or `vim ~/.zshrc`
* Add new row like this: `alias css='bash /home/baptiste/Documents/Scripts/sass.sh'`
* `source ~/.bashrc` or open a new terminal to refresh

You can use the command anywhere by typing: `css`. Do the same config for other scripts.

### sass.sh

- You need sass installed

Go inside your folder where there is a `scss` file. Run `css` command and select your file. It will automatically compress it by using the settings in the script

### git.sh

This is a simple interactive git command to commit all files, add your message en automatically commit into the dev branch.
