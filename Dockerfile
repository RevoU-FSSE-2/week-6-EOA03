FROM node:bookworm

WORKDIR /W6

COPY . .

RUN npm install

EXPOSE 3001

CMD ["node", "app.js"]