#!/bin/bash
clear
echo "Welcome aboard, hero."
firstline=$(head -1 /home/ccuser/workspace/learn-bash-scripting-project/source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version $version. "
echo ""
echo "If you would like to continue, enter 1. Exit with 0."
read versioncontinue
if [ $versioncontinue == 1 ]
then
  echo "Ok"
  for files in source/*
  do
    echo $files
    if [ "$files" == "source/secretinfo.md" ]
    then
      echo "Current file is restricted and will not be copied."
      echo ""
    else
      echo "File being copied. "
      echo ""
      cp $files /home/ccuser/workspace/learn-bash-scripting-project/build/
    fi
  done
else
  echo "Terminating script now..."
fi
cd build/
echo "Build version $version contains:"
ls -alt
cd  ..
