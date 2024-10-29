#!/bin/bash

cleanup() {
    sudo /opt/lampp/lampp stop
    exit
}

trap cleanup SIGINT

sudo /opt/lampp/lampp start
browser-sync start --proxy localhost/PAI --files "*.php" --browser "firefox"

while ;; do
    slepp 1
done
