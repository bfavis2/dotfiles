#!/bin/bash

git filter-branch --commit-filter '
  if [ "$GIT_AUTHOR_EMAIL" = "brian.r.favis@gmail.com" ];
  then
    GIT_AUTHOR_NAME="Brian Favis";
    GIT_AUTHOR_EMAIL="59325056+bfavis2@users.noreply.github.com";
    git commit-tree "$@";
  else
    git commit-tree "$@";
  fi' HEAD
