post '/questions'  do 
	if logged_in?
		@question = current_user.questions.create(params[:question])
		redirect to '/questions/' + @question.id.to_s
	else
		@message = "Please Login"
		redirect to '/sessions/new'
	end	
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end

get '/questions/:id/edit' do
	if logged_in? and current_user
		@question = Question.find(params[:id])
		erb :'questions/edit'
	else
		@message = "Please Login"
		redirect to '/sessions/new'
	end		
end

put '/questions/:id' do
	question = Question.find(params[:id])
	question.update(params[:question])
	redirect to '/questions/' + question.id.to_s
end

delete '/questions/:id' do # delete user
	question = Question.find(params[:id]).destroy
	#Answer.find(params[:question_id]).destroy
	redirect to '/'
end

