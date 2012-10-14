require 'twitter_words'
require 'twitter_words/users_tweets'

describe TwitterWords::UsersTweets do
  describe "twitter request" do
    it "should get a 200 response" do
      tw = TwitterWords::UsersTweets.new('yanismydj')
      response = tw.request
      response.status.should == 200 
    end
  end
end