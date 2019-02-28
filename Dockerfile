FROM ruby:2.5-alpine

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY app.rb ./

CMD ["ruby", "app.rb"]
