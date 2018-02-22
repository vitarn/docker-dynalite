FROM node:alpine

WORKDIR /app

RUN npm install dynalite --no-save \
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

CMD ["./node_modules/.bin/dynalite"]
