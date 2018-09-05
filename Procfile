web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
redis: redis-server
db: postgres
# watcher: ./bin/webpack-watcher
webpacker: ./bin/webpack-dev-server
