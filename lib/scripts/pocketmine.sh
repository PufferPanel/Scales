#!/bin/bash

############
#
# PocketMine-MP support for PufferPanel/Scales
#
###########

wget -h | grep syslsdksmcdvls #Dummy to get no output :)
wexit = $?
if [[ $wexit == 127 ]]; then
    echo "This system doesn't have wget installed"
    echo "Falling back to cURL"
    curl -h | grep syslsdksmcdvls #Dummy to get no output :)
    curlxit = $?
    if [[ $curlxit == 127 ]]; then
        echo "Well, this can't be anything good :P"
        echo "cURL is not installed neither is wget please install one of them \(or both\!\)"
        echo "Exiting with exit code: 127"
        exit 127
    fi
    
    if [[ $curlxit == 0 ]]; then
        echo "cURL is installed but not wget!"
        echo "Starting download of PocketMine-MP installer using cURL!"
        curl http://get.pocketmine.net | bash
    fi
fi
if [[ $wexit == 0 ]]; then
    echo "wget is installed!"
    echo "Starting download of PocketMine-MP installer using wget!"
    wget http://get.pocketmine.net -O - | bash
fi
echo "The installation is now complete!"
echo "Remember to answer any questions asked of you in the Server Control console!"
