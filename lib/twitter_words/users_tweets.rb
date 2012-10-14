require 'simple_oauth'
require 'faraday'
require 'active_support'

module TwitterWords
  class UsersTweets
    # these need to be divisible
    TOTAL_TWEETS = 1000
    PER_REQUEST = 200
    
    def initialize(user)
      @user = user
    end
    
    def base_uri
      "http://api.twitter.com"
    end
    
    def endpoint
      "/1/statuses/user_timeline.json"
    end
    
    def headers(uri)
      ::SimpleOAuth::Header.new(:get, uri, {}, credentials)
    end
    
    def connection
      @connection ||= Faraday.new(:url => base_uri)
    end
    
    def request(params = {})
      connection.get do |req|
        req.url endpoint
        req.headers['authorization'] = headers(URI(base_uri)+endpoint).to_s
        req.params = params.merge!(:screen_name => @user)
      end
    end
    
    def get_tweets
      (TOTAL_TWEETS / PER_REQUEST).times do |page|
        tweets = ActiveSupport::JSON.decode(request({:page => page, :include_rts => 0, :count => PER_REQUEST}))
      end
    end
    
    def credentials
      {
        :consumer_key     => "6DpXoV2bDzaF5UxW286yKQ",
        :consumer_secret  => "gWbEUGkVuXxiI3nsAHNE82v2j54bwbLxJeTufMRu8",
        :token            => "33167611-RZODb8NAeqWOeLYXjSLuTs6hFBKcEL4qwX2WRVax4",
        :token_secret     => "wLC4jhLz6hihlI7wDWEVo7oivVarLuprWgcN4L3Ile8"
      }
    end
  end
end