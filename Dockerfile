FROM node:10
WORKDIR /fluidsynthwebapp
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y fluidsynth
RUN apt-get install -y fluid-soundfont-gm
RUN npm i
CMD node index.js