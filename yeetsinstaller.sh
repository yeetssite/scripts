#!/bin/sh

clear
echo "Welcome to yeet's scripts installer v1.0-beta! This installer will download scripts to /usr/bin."
sleep 3s
echo "Starting download..."
echo "Downloading Yeet's Memes (executable as 'yeetsmemes')"
curl -O -s https://yeetssite.github.io/scripts/yeetsmemes
mv ./yeetsmemes ~/../usr/bin/
echo "Download Finished!"
