#! /usr/bin/zsh
chmod u+x doitall.sh
mkdir $1
cd $1
git init
rspec --init
touch spec/rename_me_spec.rb
mkdir lib
touch lib/rename_me.rb
