#!/bin/bash
pushpopfile=$HOME/.pushpop
pushd(){
  pwd >> $pushpopfile
  cd $1
}

popd(){
  tempfile=/tmp/pushpop.$$
  
  lastline=`tail -1 $pushpopfile`
  cd $lastline
  
  nblines=`wc -l $pushpopfile | cut -f1 -d' '`
  nblines=$(( nblines - 1 ))
  cp $pushpopfile $tempfile
  head -$nblines $tempfile > $pushpopfile
  
  rm $tempfile
}
