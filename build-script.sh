#!/bin/bash

cd web/meeting-helper
mint build
cd ../..
mkdir ./server/src/main/resources/public
cp -R ./web/meeting-helper/dist/** ./server/src/main/resources/public/
./gradlew build
