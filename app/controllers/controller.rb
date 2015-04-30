get '/scores' do
   Score.all.to_json
end

post '/scores' do

  username = params[:username]
  score = params[:score]

  if user = User.find_by_username(username)
    user.scores.create(score: score)
    return {username: username, score: score}.to_json
  else
    user = User.create(username: username)
    user.scores.create!(score: score)
    return {username: username, score: score}.to_json
  end
end

