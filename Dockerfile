FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir -p /var/www/testDocker2
WORKDIR      /var/www/testDocker2
COPY Gemfile /var/www/testDocker2/Gemfile
COPY Gemfile.lock /var/www/testDocker2/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /var/www/testDocker2

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]