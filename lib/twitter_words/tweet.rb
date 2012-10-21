require 'active_support'
require 'redis'

module TwitterWords
  class Tweet
    REDIS = Redis.new
    
    def initialize(user, tweet)
      REDIS.rpush(User.key(user), ActiveSupport::JSON.encode(tweet))
    end
    
    class << self
      def find(user, tweet_id)
        ActiveSupport::JSON.decode(REDIS.lindex(User.key(user), tweet_id))
      end
    end
  end
end