require "twitter_words/version"

module TwitterWords
  # Your code goes here...
  class << self
    def get_tweets(user)
      tw = TwitterWords::UsersTweets.new('yanismydj')
      response = tw.request
    end
  end
end
