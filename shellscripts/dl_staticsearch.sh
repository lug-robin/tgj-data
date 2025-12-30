#!/bin/bash

echo "download static search"
rm -rf ./static-search
rm -rf ./tmp
wget https://github.com/projectEndings/staticSearch/archive/refs/tags/v1.4.1.zip && unzip v1.4.1.zip -d tmp && rm v1.4.1.zip
mv ./tmp/staticSearch-1.4.1 ./static-search && rm -rf ./tmp

