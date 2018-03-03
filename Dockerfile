FROM node:alpine

WORKDIR /app

ENV DYNALITE_VERSION 1.2.0

RUN npm install dynalite@$DYNALITE_VERSION --no-save --production \
  && rm -Rf ~/.npm \
  && find \( \
      -type f \
      -name '.*ignore' -o \
      -name '.*rc' -o \
      -name '.travis.yml' -o \
      -name 'LICENSE*' -o \
      -name 'README*' -o \
      -name 'CHANGELOG*' -o \
      -name 'Makefile' -o \
      -name 'test.js' -o \
      -name 'example.js' -o \
      -name '*.test.js' -o \
      -name '*.ts' -o \
      -name 'yarn.lock' \
     \) -delete

EXPOSE 4567

CMD ['./node_modules/.bin/dynalite', '--createTableMs 0', '--deleteTableMs 0', '--updateTableMs 0']
