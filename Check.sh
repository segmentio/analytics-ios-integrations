#!/bin/sh

# Install dependencies from gem file to maintain consistency in all environments
echo "Checking if gem 'Bundler', exists otherwise install"
which -s bundler
    
if [[ $? != 0 ]] ; then
  sudo gem install bundler
  bundle init
fi

bundle install

echo "Checking if 'oclint' exists, otherwise install"
# Install oclint 
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    
    which -s oclint
    
    if [[ $? != 0 ]] ; then
   	 # Install oclint using homebrew

    	brew tap oclint/formulae
 	brew install oclint
    else
        brew upgrade oclint
    fi
fi

# Run pod update to install all dependencies and generate workspace files

echo "Installing and Updating Integrations dependencies"
bundle exec pod update

echo "Installing and Updating Example dependencies"
cd Example\ Projects/Simple\ Integrations\ Example 

bundle exec pod update

cd ../..