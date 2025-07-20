FROM node:14-alpine

WORKDIR /app

ENV TASKS_FOLDER=tasks
 
RUN mkdir $TASKS_FOLDER

COPY package.json .

RUN npm install

COPY . .

EXPOSE 8000

CMD [ "node", "tasks-app.js" ]