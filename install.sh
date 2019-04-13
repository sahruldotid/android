#!/bin/bash

echo "ADD YARN REPO"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "UPGRADING NODEJS & NPM"
apt update
apt install vim yarn jq moreutils
npm cache clean -f 
npm install -g n
npm i -g npm
n stable
ln -sf /usr/local/n/versions/node/10.15.3/bin/node /usr/bin/node


echo "COPYING COMPILER SCRIPT"
cp inject /usr/local/bin
cp build /usr/local/bin
chmod +x /usr/local/bin/inject
chmod +x /usr/local/bin/build



echo "INSTALLING ANDROID"
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O /tmp/sdk.zip
unzip /tmp/sdk.zip -d /opt/android
export ANDROID_HOME=/opt/android
echo "export ANDROID_HOME=/opt/android" >> ~/.bashrc


echo "SETTING PERMISSION LICENSE"
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
yes | /opt/android/tools/bin/sdkmanager --licenses


echo "INSTALLING REACT NATIVE & EXPO"
npm install -g react-native-cli
npm install -g expo-cli


echo "DISCLAIMER: DONT FORGET TO CHANGE app.json when build android using expo"
echo "Enjoy your Tools :)"
