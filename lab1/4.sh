#!/bin/bash
if [[ $PWD != $HOME ]]
then echo 'error'
exit 1
else echo $HOME
exit 0
fi
