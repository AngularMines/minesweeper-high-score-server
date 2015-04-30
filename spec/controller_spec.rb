require 'spec_helper'
require 'byebug'
require 'faker'
require 'json'

describe 'user controller' do
  describe 'POST /scores ' do
    describe 'if username does not exist' do
      it 'creates a new user' do
        expect{
          post '/scores', {username: 'bird', score: 12}
        }.to change{User.count}.by(1)
      end

      it 'creates a new score for a existing user' do
        post '/scores', {username: 'bird', score: 12}
        user = User.find_by_username('bird')
        expect(user.scores.count).to eq(1)
      end

      it "sends a json response" do
        post '/scores', {username: 'bird', score: 12}
        expect(last_response.body).to eq({username: 'bird', score: "12"}.to_json)
      end
    end

    describe 'if username exists' do

      it 'saves a score to the user' do
        user = User.create(username: 'cat')
        post '/scores', {username: user.username, score: 12}
        expect(user.scores.count).to eq(1)
      end

      it "sends a json response" do
        post '/scores', {username: 'bird', score: 12}
        expect(last_response.body).to eq({username: 'bird', score: "12"}.to_json)
      end
    end

    describe 'GET /scores' do
      it 'returns a JSON object with all users scores' do
         5.times do
          user = User.create(username: Faker::Internet.user_name)
          user.scores.create(score: Faker::Number.number(3))
         end
        get '/scores'
        expect(last_response.body.class).to eq(String)
      end

      it "should return empty array json if not score" do
        get '/scores'
        expect(JSON.parse(last_response.body)).to eq([])
      end
    end

    after do
      User.destroy_all
      Score.destroy_all
    end

  end
end

