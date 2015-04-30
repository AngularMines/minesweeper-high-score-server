require 'spec_helper'
require 'byebug'
require 'faker'
require 'json'

describe Score do
  describe "#to_json" do
    it "to_json returns formatted object" do
      user = User.create(username: "alex")
      score = Score.create(user_id: user.id, score: 1000)
      expect(score.to_json).to eq({name: user.username, time: score.score, created_at: score.created_at})
    end
end
end
