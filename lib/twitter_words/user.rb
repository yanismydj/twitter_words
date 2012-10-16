require 'twitter_words/version'
require 'twitter_words/oauth_request'
require 'active_support'
require 'redis'

module TwitterWords
  class User
    REDIS = Redis.new
    TOTAL_TWEETS_TO_STORE = 100
    
    def initialize(user)
      @user = user
    end
    
    def tweets
      REDIS.lrange(self.class.key(@user), 0, -1)
    end
    
    def total_tweets_stored
      REDIS.llen(self.class.key(@user))
    end
    
    def last_tweet
      REDIS.rpop(self.class.key(@user))
    end
    
    def get_tweets
      if total_tweets_stored < TOTAL_TWEETS_TO_STORE
        oauth_request = OauthRequest.new(user)
        response = oauth_request.request({:max_id => last_id, :count => 1000})
        parsed_response = ActiveSupport::JSON.decode(response.body)
        tweets = parsed_response.map { |tweet| tweet.slice("id", "text") }
      end
      
    end
    
    class << self
      def key(user)
        "#{user}_tweets"
      end
    end
  end
end
