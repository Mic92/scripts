#!/bin/sh

# remove wallpaper setter in standart theme to use awsetbg with my own pics
sed -i -e 's/theme.wallpaper_cmd = { "awsetbg \/usr\/share\/awesome\/themes\/default\/background.png\" }//g' /usr/share/awesome/themes/default/theme.lua
# bytecompile all librarys
find  /usr/share/awesome/lib -name \*.lua -execdir luac -o {} {} \;
