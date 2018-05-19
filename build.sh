#!/bin/bash

project="TestCILFS"

echo "Building $project ..."
mkdir -p $(pwd)/Release/$project

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
