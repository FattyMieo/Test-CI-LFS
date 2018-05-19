#! /bin/sh

project="TestCILFS"

echo "Attempting to build $project for Windows"

echo "Preparing $project ..."
/UnrealEngine/Engine/Binaries/DotNET/UnrealBuildTool.exe \
-projectfiles \
-project="$(pwd)/$project.uproject" \
-game \
-rocket \
-progress

echo "Compiling Scripts ..."
msbuild "$(pwd)/$project.sln" /t:build /p:Platform=Win64;verbosity=diagnostic

echo "Building $project ..."
if [ ! -d "$(pwd)/Release/$project" ]
then mkdir $(pwd)/Release/$project
fi
/UnrealEngine/Engine/Build/BatchFiles/RunUAT.sh \
BuildCookRun \
-project="$(pwd)/$project.uproject" \
-nop4 \
-platform=Win64 \
-clientconfig=Development \
-cook \
-allmaps \
-build \
-stage \
-pak \
-archive \
-archivedirectory="$(pwd)/Release/$project"

echo "Cooking $project ..."
/UnrealEngine/Engine/Build/BatchFiles/RunUAT.sh \
BuildCookRun \
-project="$(pwd)/$project.uproject" \
-noP4 \
-platform=Win64 \
-clientconfig=Development \
-cook \
-allmaps \
-NoCompile \
-stage \
-pak \
-archive \
-archivedirectory="$(pwd)/Release/$project"

echo "Attempting to zip builds ..."
pushd ./Release
zip -r $project.zip ./*
popd

#echo "Attempting to build $project for Windows"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath $(pwd) \
#  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe" \
#  -quit
#
#echo " "
#echo "-----------------"
#echo " Logs from build "
#echo "-----------------"
#echo " "
#cat $(pwd)/unity.log
#echo " "
#echo "-----------------"
#echo "       END       "
#echo "-----------------"
#echo " "

#echo "Attempting to build $project for OS X"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath $(pwd) \
#  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
#  -quit
#
#echo " "
#echo "-----------------"
#echo " Logs from build "
#echo "-----------------"
#echo " "
#cat $(pwd)/unity.log
#echo " "
#echo "-----------------"
#echo "       END       "
#echo "-----------------"
#echo " "
#
#echo "Attempting to build $project for Linux"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath $(pwd) \
#  -buildLinuxUniversalPlayer "$(pwd)/Build/linux/$project.exe" \
#  -quit
#
#echo " "
#echo "-----------------"
#echo " Logs from build "
#echo "-----------------"
#echo " "
#cat $(pwd)/unity.log
#echo " "
#echo "-----------------"
#echo "       END       "
#echo "-----------------"
#echo " "

#echo "Attempting to zip builds"
#pushd ./Build
#zip -r $project.zip ./windows/*
#zip -r $project.zip ./osx/*
#zip -r $project.zip ./linux/*
#popd

#zip -r $(pwd)/Build/windows.zip $(pwd)/Build/windows/
#zip -r $(pwd)/Build/mac.zip $(pwd)/Build/osx/
#zip -r $(pwd)/Build/linux.zip $(pwd)/Build/linux/