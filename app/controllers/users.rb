get '/signup' do
	erb :'users/new'
end


post '/signup' do
	@user = User.new(params[:user])
		if @user.save
			@msg = "Hey!! You r Welcome to Quora!"
			@user = User.all
			erb :"static/index"
		else
			@msg = "Please try again to sign up for free candy!"
			@user = User.all
			erb :"static/index"
		end
		# Do something processing with user input
		# redirect to '/user/dashboard'
end

# get '/user/dashboard' do
# 	erb :dashboard
# end

post '/login' do
	@user = User.find_by(email: params[:user][:email]) 
						#need to find by column name
	if @user #found out this user using email
		if @user.authenticate(params[:user][:password]) # check if the password match ornot
			log_in(@user)
			redirect '/home'
		else
			@msg = "Pokai! Wrong password lar!"
		end
	end
end

get '/logout' do
	log_out
	redirect '/'
end

get '/users/:id' do
end