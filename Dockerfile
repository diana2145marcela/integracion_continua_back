FROM ruby:2.6.5
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile* ./
RUN gem install bundler:2.1.4
RUN bundle install
RUN rails db:create
RUN rails db:migrate 
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
