FROM node:10
ADD /Fluidsynth-Webapp /fluidsynthwebapp
WORKDIR /fluidsynthwebapp
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y fluidsynth
RUN apt-get install -y fluid-soundfont-gm
RUN npm install
CMD node index.js