FROM node:alpine

RUN npm install -g dynalite \
  && rm -Rf ~/.npm

EXPOSE 4567

CMD ["dynalite"]
