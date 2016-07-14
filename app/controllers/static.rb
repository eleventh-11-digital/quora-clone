require 'byebug'


get '/home' do
  erb :"static/home"
end

get '/' do
  if !logged_in?
  	erb :"static/home"
  else
  	redirect '/?error=1'
  end
end

post '/home_index' do
	erb :"static/home"
end

get '/user/:id' do
	if logged_in?
		@user = User.find(params[:id])
		@questions = @user.questions
		@answers = @user.answers
		@uu = @user.full_name
		erb :"static/user_page"
	else
		redirect '/login/user'
	end
end

get '/question/:question_id' do
	if logged_in?
		@questions = Question.find(params[:question_id])
		@answers = @questions.answers
		erb :"static/question_page"
	else
		redirect '/login/user'
	end
end

get '/answer/:answer_id' do
	if logged_in?
		@answer = Answer.find(params[:answer_id])
		@qq = @answer.question
		erb :"static/answer_page"
	else
		redirect '/login/user'
	end
end

post '/questionvotes/:id/upvote' do	
	if logged_in? 
		@questionvote = QuestionVote.find_by(question_id:params[:id], user_id: current_user.id)
		if @questionvote
			if @questionvote.votes == 1
				@questionvote.votes = 0
			elsif @questionvote.votes == 0 || @questionvote.votes == -1
				@questionvote.votes = 1
			end
		else
			@questionvote = QuestionVote.new(question_id: params[:id], user_id: current_user.id, votes: 1)
		end
		@questionvote.save
		redirect '/home'
	else 
			redirect '/login/user'
	end
end

post '/questionvotes/:id/downvote' do
	if logged_in?
		@questionvote = QuestionVote.find_by(question_id:params[:id], user_id: current_user.id)
		if @questionvote
			if @questionvote.votes == -1
				@questionvote.votes = 0
			elsif @questionvote.votes == 0 || @questionvote.votes == 1
				@questionvote.votes = -1
			end
		else
			@questionvote = QuestionVote.new(question_id: params[:id], user_id: current_user.id, votes: -1)
		end
		@questionvote.save
		redirect '/home'
	else
		redirect '/login/user'
	end
end

post '/answervotes/:id/upvote' do
	if logged_in?
		@answervote = AnswerVote.find_by(answer_id:params[:id], user_id: current_user.id)
		if @answervote
			if @answervote.votes == 1
				@answervote.votes = 0
			elsif @answervote.votes == 0 || @answervote.votes == -1
				@answervote.votes = 1
			end
		else
			@answervote = AnswerVote.new(answer_id: params[:id], user_id: current_user.id, votes: 1)
		end
		@answervote.save
		redirect '/home'
	else
		redirect '/login/user'
	end		
end

post '/answervotes/:id/downvote' do
	if logged_in?
		@answervote = AnswerVote.find_by(answer_id:params[:id], user_id: current_user.id)
		if @answervote
			if @answervote.votes == -1
				@answervote.votes = 0
			elsif @answervote.votes == 0 || @answervote.votes == 1
				@answervote.votes = -1
			end
		else
			@answervote = AnswerVote.new(answer_id: params[:id], user_id: current_user.id, votes: -1)
		end
		@answervote.save
		redirect '/home'
	else
		redirect '/login/user'
	end		
end

post '/questions' do
	if logged_in?
		@question = Question.new(question: params[:question], user_id: current_user.id)
		@question.save
		redirect '/home'
	else
		redirect '/login/user'
	end
end

post '/answer/new/:question_id' do
	if logged_in?
		@answer = Answer.new(user_id: current_user.id, answer: params[:answer], question_id: params[:question_id])
		@answer.save
		redirect '/home'
	else
		redirect '/login/user'
	end
end
