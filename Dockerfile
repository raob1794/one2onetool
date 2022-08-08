FROM node
WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install
EXPOSE 3000
CMD DATA_FILE=Question-test.json npm start
CMD ["DATA_FILE=Question-test.json", "npm" ,"start"]
