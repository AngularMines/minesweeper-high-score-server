require 'spec_helper'
require 'byebug'
require 'faker'
require 'json'

describe 'user controller' do
  describe 'POST /save_user' do
    it 'creates a new user' do
      expect{
        post '/save_user', {username: 'bird', score: 12}
      }.to change{User.count}.by(1)
    end
    it 'creates a new score for a user' do
      post '/save_user', {username: 'bird', score: 12}
      user = User.find_by_username('bird')
      expect(user.scores.count).to eq(1)
    end
  end

  describe 'POST /save_score' do
    it 'Saves score to an existing user' do
      user = User.create(username: 'bird')
      post '/save_score', {score: 12}, {'rack.session' =>  { 'user_id' => user.id } }
      expect(user.scores.count).to eq(1)
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
  end

  describe "GET /scores" do
    before do
      get '/scores'
    end
    it "should return empty array json if not score" do
      expect(JSON.parse(last_response.body)).to eq([])
    end
  end

  after do
    User.destroy_all
    Score.destroy_all
  end

end
