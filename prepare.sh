#! /bin/sh

project="TestCILFS"

echo "Preparing $project ..."
/UnrealEngine/Engine/Binaries/DotNET/UnrealBuildTool.exe \
-projectfiles \
-project="$(pwd)/$project.uproject" \
-game \
-rocket \
-progress
