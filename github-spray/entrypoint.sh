#!/bin/sh

git config --global user.name "$USERNAME"
git config --global user.email "$USEREMAIL"

exec github-spray $@
