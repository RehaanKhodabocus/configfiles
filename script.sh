#!/usr/bin/env bash

defaults write com.apple.finder ShowPathbar -int 1
defaults write com.apple.finder ShowStatusBar -int 1

killall Finder
open -a Finder 
