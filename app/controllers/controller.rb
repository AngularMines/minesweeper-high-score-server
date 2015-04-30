require 'sinatra/json'

get '/scores' do
   json(Score.all.map { |score| score.to_json })
end

post '/scores' do

  username = params[:username]
  score = params[:score]

  if user = User.find_by_username(username)
    user.scores.create(score: score)
    return json({username: username, score: score})
  else
    user = User.create(username: username)
    user.scores.create!(score: score)
    return json({username: username, score: score})
  end
end

