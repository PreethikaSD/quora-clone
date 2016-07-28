post '/answers'  do 
	if logged_in? 
		@answer = current_user.answers.create(question_id: params[:question][:id], text: params[:answer][:text])
		redirect to '/questions/' + @answer.question_id.to_s
	else
		@message = "Please Login"
		redirect to '/sessions/new'
	end		
end

get '/answers/:id' do
	@answer = Answer.find(params[:id])
	erb :'questions/show'
end

get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	erb :'answers/edit'
end

put '/answers/:id' do
	answer = Answer.find(params[:id])
	answer.update(params[:answer])
	redirect to '/questions/' + answer.question_id.to_s
end

delete '/answers/:id' do # delete user
	answer = Answer.find(params[:id]).destroy
	redirect to 'questions/' + answer.question_id.to_s
end
