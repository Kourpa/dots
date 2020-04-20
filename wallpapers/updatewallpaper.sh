#!/bin/zsh

files=(/home/kourpa/.config/wallpapers/*.jpg)
wallpaper=${files[RANDOM % ${#files[@]}]}

cp $wallpaper /home/kourpa/.config/awesome/themes/powerarrow-dark/wall.png
