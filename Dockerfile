FROM ruby:2.6.6

RUN apt-get update -yqq \
		&& apt-get install -yqq --no-install-recommends vim \
		&& rm -rf /var/lib/apt/lists

ENV APP_PATH /usr/src/app

RUN gem install thin
RUN gem install sinatra
RUN gem install sinatra-reloader
RUN gem install pony

WORKDIR $APP_PATH
COPY . .

EXPOSE 4567
CMD ./docker-entrypoint.sh