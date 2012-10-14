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
    
    def endpoint
      "http://api.twitter.com/1/statuses/#{@user}.json"
    end
    
    def headers(uri)
      ::SimpleOAuth::Header.new("GET", uri, {}, credentials)
    end
    
    def credentials
      {
        :consumer_key     => "6DpXoV2bDzaF5UxW286yKQ",
        :consumer_secret  => "gWbEUGkVuXxiI3nsAHNE82v2j54bwbLxJeTufMRu8",
        :token            => "33167611-RZODb8NAeqWOeLYXjSLuTs6hFBKcEL4qwX2WRVax4",
        :token_secret     => "wLC4jhLz6hihlI7wDWEVo7oivVarLuprWgcN4L3Ile8"
      }
    end
    
    def connection
      @connection ||= Faraday.new(endpoint)
    end
    
    def request(params = {})
      request_headers = {:authorization => headers(endpoint).to_s}
      connection.url_prefix = endpoint
      connection.run_request(:get, '/', params.merge!(:include_rts => 0, :count => PER_REQUEST), request_headers)
    end
    
    def get_tweets
      (TOTAL_TWEETS / PER_REQUEST).times do |page|
        tweets = ActiveSupport::JSON.decode(request({:page => page}))
      end
    end
  end
end