FROM ruby:2.4
LABEL maintainer "mozamimy (Moza USANE) <alice@mozami.me>"

RUN apt-get update && apt-get upgrade -y

RUN mkdir /log

WORKDIR /app
COPY . /app
RUN bundle install -j4 --deployment --without 'development test'

CMD ["bundle", "exec", "unicorn", "-c", "/app/config/unicorn.rb"]
