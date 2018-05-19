#! /bin/sh

project="TestCILFS"

echo "Compiling Scripts ..."
msbuild "$(pwd)/$project.sln" /t:build /p:Platform=Win64;verbosity=diagnostic
