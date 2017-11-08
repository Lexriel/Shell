#!/bin/bash
CAN=$HOME/.poubelle
COM=`basename $0`

usage(){
    echo "Commande de gestion d'une poubelle"
    echo "Usage : $COM -l liste le contenu de la poubelle"
    echo "      : $COM -r d\'etruit la poubelle"
    echo "      : $COM foo bar d\'eplace foo et bar dans la poubelle"
}

if [ ! -d $CAN ]; then
    mkdir $CAN
fi

case $1 in
    -l) echo "$CAN :" 
 ls -lR $CAN
 exit 0 ;;
    -r) echo "détruit la poubelle"
 rm -rf $CAN/*
 exit 0 ;;
esac

if [ $# -ge 1 ]; then
    mv $@ $CAN
else
    usage
fi
