#!/bin/bash
#This script makes it easier to run the git remote cammond without having to type
#the full syntax out everytime
echo "Enter repository name below:"
echo ""
read repositoryName
git remote add origin git@github.com:Schofield88/$repositoryName
