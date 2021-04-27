#!/bin/bash

cd web/meeting-helper
mint build --skip-service-worker -e .env.production
cd ../..
rm -rf ./server/src/main/resources/public
mkdir ./server/src/main/resources/public
cp -R ./web/meeting-helper/dist/** ./server/src/main/resources/public/
./gradlew build
