FROM node:16.10.0

#ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install
# --production

COPY src ./src
COPY public ./public

RUN npm run build

CMD [ "node_modules/http-server/bin/http-server", "dist" ]
