#!/bin/bash

BUFFER_DIR=$HOME/storage/downloads
VIDEO_URL=$1
VIDEO_ID=$(echo $VIDEO_URL | grep -oP '=\K.*$')

cd $BUFFER_DIR && (youtube-dl -k --cache-dir $BUFFER_DIR -f bestvideo+bestaudio --no-part --id $VIDEO_URL)
xdg-open --content-type video $BUFFER_DIR/$VIDEO_ID.mp4 || xdg-open $BUFFER_DIR/$VIDEO_ID.mp4
