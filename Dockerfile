FROM node
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
EXPOSE 3000
CMD npm start
CMD ["npm" ,"start"]
