#!/bin/sh

# Run tests from parent directory
cd ..

# Run pod update to install all dependencies and generate workspace files
echo "Installing and updating integrations dependencies"
bundle exec pod update

echo "Installing and updating example dependencies"
cd Example\ Projects/Simple\ Integrations\ Example 

bundle exec pod update

