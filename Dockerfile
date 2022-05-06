FROM ubuntu:20.04

RUN apt clean -y
RUN apt update -y
RUN apt install -y curl build-essential python gcc g++

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt install -y nodejs jq

COPY . /usr/app

WORKDIR /usr/app

RUN npm install
RUN npm run build

RUN npm install -g pm2

RUN sed -i 's/pidusage(pids, function retPidUsage(err, statistics) {/pidusage(pids, { usePs: true }, function retPidUsage(err, statistics) {/' /usr/lib/node_modules/pm2/lib/God/ActionMethods.js

ARG PORT

ENV PORT=$PORT

EXPOSE $PORT

ENTRYPOINT ["./bin/entrypoint.sh"]
