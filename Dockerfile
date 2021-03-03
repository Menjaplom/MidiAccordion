FROM node:10
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y fluidsynth fluid-soundfont-gm alsa-tools
ADD /midi_internals /midi_internals
WORKDIR /midi_internals/Fluidsynth-Webapp
RUN npm install
WORKDIR /midi_internals
RUN ["chmod", "-x", "initfuid.sh"]
CMD bash initfluid.sh