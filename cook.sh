#! /bin/sh

project="TestCILFS"

echo "Cooking $project ..."
~/UnrealEngine/Engine/Build/BatchFiles/RunUAT.sh \
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
