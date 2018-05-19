#!/bin/bash

project="TestCILFS"

echo "Attempting to zip builds ..."
pushd ./Release
zip -r $project.zip ./*
popd
