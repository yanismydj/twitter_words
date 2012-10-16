require 'twitter_words'
require 'twitter_words/tweet'
require 'twitter_words/user'

describe TwitterWords::Tweet do
  before :each do
    Redis.new.flushdb
    @sample_tweet = '{"id" => 1111, "text" => "test 1234!"}'
  end
  
  describe "save tweet" do
    it "should save the tweet to redis" do
      tweet = TwitterWords::Tweet.new('yanismydj', @sample_tweet).should be_true
    end
  end
end