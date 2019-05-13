FROM node

WORKDIR /usr/src/app

ADD node_modules node_modules
ADD app.js app.js

ENTRYPOINT ["node", "app"]
