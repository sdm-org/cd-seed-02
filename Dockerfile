FROM atomist/sdm-base:undefined

RUN apt-get update && apt-get install -y \
        openjdk-8-jdk
RUN apt-get update  && apt-get install -y \
        maven \
    && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

VOLUME /opt/app
