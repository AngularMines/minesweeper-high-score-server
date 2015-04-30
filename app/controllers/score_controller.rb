get '/scores' do
   Score.all.to_json
end

post '/save_user' do
  user = User.new(username: params[:username])
  if user.save
    session[:user_id] = user.id
    user.scores.create!(score: params[:score])
  else
    puts "Register not success."
  end
end

post '/save_score' do
  user = User.find(session[:user_id])
  user.scores.create(score: params[:score])
end

