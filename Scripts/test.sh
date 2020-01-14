#!/bin/sh

# Run tests from parent directory
cd ..

# Check if tests run successfully
xcodebuild test -target TARGET -configuration Debug -scheme Segment-Facebook
