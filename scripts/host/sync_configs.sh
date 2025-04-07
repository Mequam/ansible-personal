#!/usr/bin/bash

# this script backs up config files that I use on my primary machine and ensures
# they are stored and up to date

#this is where we send files to
CONFIG_GIT_REPO=~/ProgramingWorkshop/bash/config/

CONFIG_FILES=(~/.tmux.conf ~/.bashrc ~/.zshrc ~/.profile ~/.oh-my-zsh/themes/copper-mn.zsh-theme ~/.config/zk/config.toml)
CONFIG_REPOS=(~/.config/nvim ~/Documents/notes/primary_zk ~/.config/awesome/)
GIT_REMOTE=local
GIT_REMOTE_BRANCH=main



START_DIRECTORY=$(pwd)

#copy each of the files to the config repo
for f in ${CONFIG_FILES[*]}; do
   if [ -f $f ]; then
      echo "[*] copying over $f to $CONFIG_GIT_REPO"
      cp $f $CONFIG_GIT_REPO
   fi
done


cd $CONFIG_GIT_REPO

git add -A
git commit -m "automated commit saving configs"
git push $GIT_REMOTE $GIT_REMOTE_BRANCH

cd $START_DIRECTORY



for r in ${CONFIG_REPOS[*]}; do
   if [ -d $r ]; then
      cd $r
      echo "[*] backing up $r"
      git add -A
      git commit -m "automated commimt saving configs"
      git push $GIT_REMOTE $GIT_REMOTE_BRANCH
      cd $START_DIRECTORY
   fi
done
