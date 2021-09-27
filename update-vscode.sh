#!/bin/bash

wget -O code.tar.gz 'https://code.visualstudio.com/sha/download?build=stable&os=linux-x64'
tar -xf code.tar.gz


argc=$#
argv=("$@")

for (( j=0; j<argc; j++ )); do
    cd $HOME/.vscode/"${argv[j]}"
    rm -rf *[!"data"]*
    cd $HOME/.vscode/base/VSCode-linux-x64/
    cp * $HOME/.vscode/"${argv[j]}" -R
    mv $HOME/.vscode/"${argv[j]}"/code $HOME/.vscode/"${argv[j]}"/${argv[j]}
done

rm $HOME/.vscode/base/VSCode-linux-x64 -R
rm $HOME/.vscode/base/code.tar.gz