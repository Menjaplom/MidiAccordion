#!/bin/bash

if pgrep -x "fluidsynth" > /dev/null
then
echo fluidsynth already flowing
else
fluidsynth -si -p "fluid" -C0 -R0 -r48000 -d -f ./fluidsynth_config.txt -a alsa -m alsa_seq &
fi

sleep 3

mini=$(aconnect -o | grep "MINILAB")
usbMidi=$(aconnect -o | grep "USB MIDI Interface")

if [[ $mini ]]
then
aconnect 'Arturia MINILAB':0 'fluid':0
echo MINIlab connected
elif [[ $usbMidi ]]
then
aconnect 'USB MIDI Interface':0 'fluid':0
echo USB MIDI Interface connected
else
echo No known midi devices available. Try aconnect -l
fi

cd ./Fluidsynth-Webapp
node index.js
cd ..

exit