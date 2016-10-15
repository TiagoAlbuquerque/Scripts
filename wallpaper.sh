#!/bin/sh
sleep 60

PICTURE_DIR="$HOME/Pictures/bing-wallpapers/"
OLD_PICTURES_DIR="$HOME/Pictures/bing-pictures/"

echo "moving current pictures\n"
cp -v $PICTURE_DIR* $OLD_PICTURES_DIR

echo "\ndeleting current pictures\n"
rm -v -rf $PICTURE_DIR
mkdir -p $PICTURE_DIR

echo "\ndownloading new pictures\n"

urls=( $(curl -s http://www.bing.com | \
    grep -Eo "url:'.*?'" | \
    sed -e "s/url:'\([^']*\)'.*/http:\/\/bing.com\1/" | \
    sed -e "s/\\\//g") )


for p in ${urls[@]}; do
    filename=$(echo $p|sed -e "s/.*\/\(.*\)/\1/")
    if [ ! -f $PICTURE_DIR/$filename ]; then
        echo "Downloading: $filename ..."
        curl -Lo "$PICTURE_DIR/$filename" $p
    else
        echo "Skipping: $filename ..."
    fi
done
