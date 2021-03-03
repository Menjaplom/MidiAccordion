FROM node:10
ADD /midi_internals /midi_internals
WORKDIR /midi_internals
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y fluidsynth fluid-soundfont-gm alsa-tools
RUN npm install
RUN chmod -x initfuid.sh
CMD ./initfuid.sh