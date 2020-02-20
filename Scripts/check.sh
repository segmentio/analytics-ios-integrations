#!/bin/sh

# Install dependencies from gem file to maintain consistency in all environments
echo "$(tput setaf 4)Checking if gem 'Bundler' exists"

which -s bundler
    
if [[ $? != 0 ]] ; then
    echo "$(tput setaf 3) Installing 'Bundler'..."
    sudo gem install bundler
    bundle init
fi

echo "$(tput setaf 3)Bundler installed...Installing/updating required gems"
bundle install

echo "$(tput setaf 4)Checking if 'oclint' exists.."
# Install oclint 
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "$(tput setaf 1)Homebrew not installed, installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    
    which -s oclint
    
    if [[ $? != 0 ]] ; then

	    # Install oclint using homebrew
	    echo "$(tput setaf 3)Installing OClint"
        brew tap oclint/formulae
 	    brew install oclint
    else
        echo "$(tput setaf 3)Updating OClint..."
        brew upgrade oclint
    fi
fi

echo "$(tput setaf 4)Checking if 'clang-format' exists.."

which -s clang-format

if [[ $? != 0 ]] ; then

	brew install clang-format
	export PATH=/usr/local/bin:$PATH
        
fi

