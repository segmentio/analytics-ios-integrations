#!/bin/sh


# Run pod update to install all dependencies and generate workspace files

echo "Installing and Updating Integrations dependencies"
bundle exec pod update

echo "Installing and Updating Example dependencies"
cd Example\ Projects/Simple\ Integrations\ Example 

bundle exec pod update

cd ../..
