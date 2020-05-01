FROM node:alpine as base
WORKDIR /srv
FROM base as build
RUN set -eux; \
    apk add --update --no-cache \
        git \
        build-base \
    ; \
    git clone --recurse-submodules https://github.com/inolen/quakejs.git . ; \
    npm install

RUN set -eux; \
    # skip the eula
    sed -i 's/,PromptEULA:function (callback) {/,PromptEULA:function (callback) { return callback();/' build/ioq3ded.js ; \
    # use public CDN
    sed -i 's/<%= content %>/content.quakejs.com/' bin/index.ejs ; \
    # auto-connect to current server
    sed -i 's/getQueryCommands())/["+connect", location.hostname + ":27960"])/' bin/index.ejs

FROM base as run
COPY --from=build /srv /srv

FROM run as server
EXPOSE 27960
VOLUME /srv/base
CMD node build/ioq3ded.js +set fs_game baseq3 +set dedicated 1 +exec server.cfg

FROM run as web
EXPOSE 8080
CMD node bin/web.js
