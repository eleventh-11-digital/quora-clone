get '/' do
  erb :"static/index"
end

get '/home' do
  if logged_in?
  	erb :"static/home"
  else
  	redirect '/?error=1'
  end
end