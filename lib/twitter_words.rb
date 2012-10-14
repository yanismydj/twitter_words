require "twitter_words/version"

module TwitterWords
  class << self
    def get_tweets(user)
      tw = TwitterWords::UsersTweets.new(user)
      response = tw.request
    end
  end
end
