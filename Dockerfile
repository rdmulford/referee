FROM node:10.18.1-alpine

RUN apk add --no-cache ca-certificates

RUN mkdir -p /opt/referee/
WORKDIR /opt/referee/

COPY . .
RUN yarn
RUN yarn bootstrap
RUN yarn workspaces run build

CMD ["node", "packages/server/build/index.js"]
