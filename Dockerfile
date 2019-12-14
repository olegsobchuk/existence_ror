FROM ruby:2.7.0-preview3-slim-buster

ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV SKIP_YARN_INTEGRITY_CHECK=true
ENV RAILS_MASTER_KEY=322deed2890d3ceea957d33d80c44409

WORKDIR /app
COPY . /app

RUN rm -rf ./node_modules
RUN ln -s /opt/node_modules /app/node_modules

RUN bundle install -j4
RUN yarn install
RUN bundle exec rails assets:precompile

RUN rm -rf /opt/node_modules > /dev/null
RUN rm -rf /app/node_modules > /dev/null
RUN rm -rf /app/app/javascript > /dev/null
RUN rm -rfv ~/.bundle/cache > /dev/null
RUN yarn cache clean

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
