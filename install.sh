#!/bin/bash

# The steps
# 1. Get Visual Studio Build Tools
# 2. Get Unreal Engine from GitHub
# 3. Build Unreal Engine with Build Tools
# 4. Build project with Unreal Engine

# Problems
# - Cannot figure out how to get and use VS Build Tools (in OS X it cannot run .exe)
# - Haven't try to build project with Unreal Engine under command-line

UE_REPOSITORY=https://github.com/EpicGames/UnrealEngine.git
UE_INSTALL_DIR=~/UnrealEngine
UE_VERSION=4.19.2-release

mkdir -p $UE_INSTALL_DIR

pushd $UE_INSTALL_DIR
git clone --branch $UE_VERSION --depth 1 $UE_REPOSITORY $UE_INSTALL_DIR
./Setup.sh
./GenerateProjectFiles.sh
make
popd

### Old Scripts ###
#BASE_URL=https://download.unity3d.com/download_unity
#HASH=a9f86dcd79df
#VERSION=2017.3.0f3
#
#download() {
#  file=$1
#  url="$BASE_URL/$HASH/$package"
#
#  echo "Downloading from $url: "
#  curl -o `basename "$package"` "$url"
#}
#
#install() {
#  package=$1
#  download "$package"
#
#  echo "Installing "`basename "$package"`
#  sudo installer -dumplog -package `basename "$package"` -target /
#}
#
## See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
## of available packages, where PLATFORM is `osx` or `win`
#
#install "MacEditorInstaller/Unity-$VERSION.pkg"
#install "MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-$VERSION.pkg"
##install "MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-$VERSION.pkg"
##install "MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-$VERSION.pkg"