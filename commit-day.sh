#!/bin/bash

# command takes 4 arguments: year, month, day to start committing, day to end committing

mkdir $2
cd $2
for (( D=$3; D<=$4; D++))
do
  mkdir $D
  cd $D
  n=$((RANDOM%7+1))
  for ((i=1; i<$n; i++))
  do
    echo "$i on $2/$D/$1" > commit.md
    export GIT_COMMITTER_DATE="$1-$2-$D 12:$i:00"
    export GIT_AUTHOR_DATE="$1-$2-$D 12:$i:00"
    git add commit.md -f
    git commit --date="$1-$2-$D 12:0$i:00" -m "$i on $2 $D $1"
  done      
  cd ../
done

cd ../

git push origin main
git rm -rf $2
git commit -am "cleanup"
git push origin main