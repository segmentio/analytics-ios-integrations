#!/bin/sh

# Run tests from parent directory
cd ..

# Check if tests run successfully
xcodebuild test -target TARGET -configuration Debug -scheme Segment-Facebook | xcpretty
xcodebuild test -target TARGET -configuration Debug -scheme Segment-Mixpanel | xcpretty
xcodebuild test -target TARGET -configuration Debug -scheme Segment-Firebase | xcpretty
