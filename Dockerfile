FROM ruby:2.6.6-slim-buster

RUN apt-get update
RUN apt-get -y install bash \
        libxml2-dev \
        build-essential \
        patch \
        curl \
        ruby-dev \
        zlib1g-dev \
        liblzma-dev \
        libpq-dev \
        nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install yarn
RUN yarn add webpack

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV SKIP_YARN_INTEGRITY_CHECK=true
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_MASTER_KEY=21541b3c4ad012c663caa97a6ef9ff12

WORKDIR /app
COPY . /app

RUN gem update bundler
RUN bundle install -j4
RUN yarn install
RUN bundle exec rails assets:precompile

RUN rm -rf /opt/node_modules > /dev/null
RUN rm -rf /app/node_modules > /dev/null
RUN rm -rf /app/app/javascript > /dev/null
RUN rm -rfv ~/.bundle/cache > /dev/null
RUN yarn cache clean

RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
