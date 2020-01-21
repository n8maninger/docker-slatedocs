FROM alpine/git:1.0.7 AS retrieve

WORKDIR /app
RUN git clone https://github.com/slatedocs/slate

FROM ruby:2.6.5

COPY --from=retrieve /app/slate /usr/src/app

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN gem install bundler --version '2.0.2'
RUN bundle install

VOLUME /usr/src/app/source

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]