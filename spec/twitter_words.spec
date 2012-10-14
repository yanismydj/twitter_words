require 'twitter_words'
require 'twitter_words/users_tweets'

describe TwitterWords::UsersTweets do
  describe "twitter request" do
    before :each do
      tw = TwitterWords::UsersTweets.new('yanismydj')
      @response = tw.request
    end
    
    it "should get a 200 response" do
      puts @response
      puts @response.body
      @response.status.should == 200 
    end
    
    # it "should have gotten 200 tweets" do
    #   tweets = ActiveSupport::JSON.decode(@response.body)
    #   puts tweets
    #   tweets.size.should == 200
    # end
  end
end