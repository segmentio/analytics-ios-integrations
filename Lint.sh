unset LLVM_TARGET_TRIPLE_SUFFIX

xcodebuild -target Segment-Facebook -configuration Debug -scheme Segment-Facebook clean
xcodebuild -target Segment-Facebook -configuration Debug -scheme Segment-Facebook COMPILER_INDEX_STORE_ENABLE=NO | xcpretty -r json-compilation-database --output compile_commands.json
oclint-json-compilation-database —e Segment_Facebook.h Segment_Facebook_vers.c -- build -report-type xcode


pod lib lint --use-libraries --allow-warnings
