require 'twitter_words'
require 'twitter_words/oauth_request'

describe TwitterWords::OauthRequest do
  describe "twitter request" do
    before :each do
      oauth_request = TwitterWords::OauthRequest.new('codinghorror', 100)
      @response = oauth_request.request
    end
    
    it "should get a 200 response" do
      @response.status.should == 200 
    end
  end
end
