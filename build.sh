#! /bin/sh

project="TestCILFS"

echo "Building $project ..."
if [ ! -d "$(pwd)/Release/$project" ]
then mkdir $(pwd)/Release/$project
fi
~/UnrealEngine/Engine/Build/BatchFiles/RunUAT.sh \
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
