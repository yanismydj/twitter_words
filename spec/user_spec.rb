require 'twitter_words'
require 'twitter_words/user'
require 'twitter_words/tweet'

describe TwitterWords::User do
  before :each do
    @redis = Redis.new
    @redis.flushdb
    
    @sample_tweets = [{"id" => 1111, "text" => "test 1234!"}, {"id" => 1112, "text" => "test again!"}]
    
    @sample_tweets.each do |sample_tweet|
      tweet = TwitterWords::Tweet.new('yanismydj', sample_tweet)
    end
    
    @yan = TwitterWords::User.new('yanismydj')
  end
  
  describe "tweets" do
    it "should get all of a users tweets" do
      @yan.tweets.size.should == 2
    end
  end
  
  describe "total_tweets_stored" do
    it "should know how many tweets we've stored for a given user" do
      @yan.total_tweets_stored.should == 2
    end
  end
  
  describe "last_tweet" do
    it "should get the users last tweet" do
      @yan.last_tweet["id"].should == @sample_tweets.last["id"]
    end
  end
  
  describe "get_tweets" do
    it "should get more tweets" do
      @yan.get_tweets(10)
      @yan.reload.total_tweets.size.should == 12
    end
  end
end