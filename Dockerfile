FROM ruby:3.1.3-alpine

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

RUN apk update \
 && apk add --no-cache  \
    build-base  \
    ruby-dev

WORKDIR /app

COPY Gemfile Gemfile.lock config.ru ./

RUN bundle install

COPY app.rb ./

RUN chown -R appuser:appgroup /app

USER 1000

EXPOSE 4567/TCP
CMD [ "bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567" ]
