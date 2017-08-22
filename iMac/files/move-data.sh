#!/bin/bash

PWD=$(pwd)

cd ~/ZetaZero/
FILES=$(ls *.dat 2> /dev/null)

sleep 1
for x in $FILES
do
    res=($(wc -c $x))
    if [ "${res[0]}" -ne 0 ]; then
        echo ${res[1]}
        mv ${res[1]} data/
    fi
done

cd data
rm zetazero*.tsv 2> /dev/null
oldname=$(ls *.dat | sort -n | tail -1)
newname=$(ls *.dat | sort -n | tail -1 | sed -e "s/.dat/.tsv/g" | sed -e "s/^0/zetazero/g")
cat *.dat | sort -n > $newname
ls -l
scp $newname takamasa@Fuga.local:

if [ "$1" = "-m" ]; then
    rm *.dat 2> /dev/null
    mv $newname $oldname
    ls -l
fi

cd $PWD

