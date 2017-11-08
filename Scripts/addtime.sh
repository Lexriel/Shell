#!/bin/bash

addtime() {

if [ $# -ne 2 ]
then
  echo "Usage $0-addtime: addtime date1 date2"
  exit 1
fi

jour1=`echo $1 | cut -d+ -f1`
if [ $jour1 = $1 ]
then
  jour1=0
fi
jour2=`echo $2 | cut -d+ -f1`
if [ $jour2 = $2 ]
then
  jour2=0
fi
heure1=`echo $1 | cut -d+ -f2 | cut -d: -f1`
if [ $heure1 = `echo $1 | cut -d+ -f2` ]
then
  echo $0-addtime: Bad Format $1
  exit 1
fi
heure2=`echo $2 | cut -d+ -f2 | cut -d: -f1`
if [ $heure2 = `echo $2 | cut -d+ -f2` ]
then
  echo $0-addtime: Bad Format $2
  exit 1
fi
minute1=`echo $1 | cut -d+ -f2 | cut -d: -f2`
if [ $minute1 = `echo $1 | cut -d+ -f2` ]
then
  echo $0-addtime: Bad Format $1
  exit 1
fi
minute2=`echo $2 | cut -d+ -f2 | cut -d: -f2`
if [ $minute2 = `echo $2 | cut -d+ -f2` ]
then
  echo $0-addtime: Bad Format $2
  exit 1
fi

#echo $jour1 $heure1 $minute1 $jour2 $heure2 $minute2

heure=0
minute=$(( minute1 + minute2 ))
#echo ${minute}
if [ $minute -gt 60 ]
then
  heure=$(( minute / 60 ))
  minute=$(( minute % 60 ))
fi

jour=0
heure=$(( heure + heure1 + heure2 ))
#echo $heure
if [ $heure -gt 24 ]
then
  jour=$(( heure / 24 ))
  heure=$(( heure % 24 ))
fi

jour=$(( jour + jour1 + jour2 ))

if [ $jour -ne 0 ]
then
  echo $jour+$heure:$minute
else
  echo $heure:$minute
fi
 
}

addtime 15+10:00 21+9:30
