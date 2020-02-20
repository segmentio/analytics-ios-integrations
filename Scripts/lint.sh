#!/bin/sh

# Move to root, to run oclint on workspace
cd ..

# Run oclint related commands to check for any issues
SCHEME=${1?Please Provide Target Name}

echo "$(tput setaf 4) Running OClint"

unset LLVM_TARGET_TRIPLE_SUFFIX

xcodebuild -target $SCHEME -configuration Debug -scheme $SCHEME clean
xcodebuild -target $SCHEME -configuration Debug -scheme $SCHEME COMPILER_INDEX_STORE_ENABLE=NO | xcpretty -r json-compilation-database --output compile_commands.json
oclint-json-compilation-database -e Pods -e Xcode/DerivedData -- -report-type xcode


# Run pod lint to check for any issues in podspec

echo "$(tput setaf 4) Linting pod spec"
read -p 'Please Enter Directory of Intergation to Lint Pod Spec: ' dir

# Move to integrations destinations to run pod lint
cd $dir

pod lib lint --use-libraries --allow-warnings
