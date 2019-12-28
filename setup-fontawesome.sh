#!/bin/bash

curl -O https://use.fontawesome.com/releases/v5.12.0/fontawesome-free-5.12.0-web.zip
unzip fontawesome-free-5.12.0-web.zip
mkdir -p public/styles/font-awesome/css
cp fontawesome-free-5.12.0-web/css/all.min.css public/styles/font-awesome/css/
mkdir -p public/styles/font-awesome/webfonts
cp fontawesome-free-5.12.0-web/webfonts/* public/styles/font-awesome/webfonts/
rm -rf fontawesome-free-5.12.0-web
rm fontawesome-free-5.12.0-web.zip
