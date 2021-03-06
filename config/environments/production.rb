# drawings per page
PER_PAGE = 36

# s3 bucket
S3_BUCKET = 'draw.heroku.com'

# redis
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

# facebook
FACEBOOK = {
  'app_id'     => ENV["FB_APP_ID"],
  'app_secret' => ENV["FB_APP_SECRET"]
}

# twitter
TWITTER = {
  'consumer_key'    => ENV["TWITTER_CONSUMER_KEY"],
  'consumer_secret' => ENV["TWITTER_CONSUMER_SECRET"]
}

# enable newrelic monitoring
require 'newrelic_rpm'