#!/bin/sh
brew install pygments

git clone https://github.com/aslakhellesoy/gherkin-pygments-lexer.git
pushd gherkin-pygments-lexer
sudo python setup.py install
popd

git clone https://github.com/roadrunner2/pygments-groovy.git
pushd pygments-groovy
sudo python setup.py install
popd