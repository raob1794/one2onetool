FROM node

ARG DATA_FILE="Questions-test.json"
ENV DATA_FILE=${DATA_FILE}

WORKDIR /app
COPY package.json /app
ADD . /app
RUN npm install

EXPOSE 3000
CMD ["npm" ,"start"]

