require 'sinatra/json'


before do
   content_type :json
   headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
end

set :protection, false


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



