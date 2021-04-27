#!/bin/bash

# install mint
wget --no-verbose -O mint https://mint-lang.s3-eu-west-1.amazonaws.com/mint-master-linux
chmod +x ./mint
sudo mv ./mint /usr/local/bin/mint

# build
cd web/meeting-helper
mint build --skip-service-worker -e .env.production
cd ../..
rm -rf ./server/src/main/resources/public
mkdir ./server/src/main/resources/public
cp -R ./web/meeting-helper/dist/** ./server/src/main/resources/public/
./gradlew build
