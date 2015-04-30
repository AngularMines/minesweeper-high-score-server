require 'spec_helper'

describe 'ScoreController' do
  before do
    get '/scores'
  end

  describe "GET /scores" do
    it "should return empty array json if not score" do
      expect(JSON.parse(last_response.body)).to eq([])
    end
  end
end
