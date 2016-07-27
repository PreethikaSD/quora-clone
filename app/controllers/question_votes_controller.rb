post '/questions/:id/upvote' do
	if logged_in?
		vote = QuestionVote.find_by(question_id: params[:id], users_id: current_user.id)
		# check if Question has been voted by user
		if vote
			if vote.vote == 1
				@message = "You can only vote once per question"
				@question = Question.find(params[:id])
				erb :'questions/show'
			else
				@message = "Your vote has been changed to upvote"
				vote.update(vote: 1)
				redirect to '/questions/' + params[:id].to_s
			end	
		else
			@message = "Your vote will change the future"
			QuestionVote.create(question_id: params[:id], users_id: current_user.id, vote: 1)
			#current_user.question_votes.create()
			redirect to '/questions/' + params[:id].to_s
		end
	else
		@message = "Please login to vote"
		erb :'sessions/new'
	end	
end

	#count = count_question_vote(params[:question][:upvote], params[:question][:downvote])

post '/questions/:id/downvote' do
	if logged_in?
		vote = QuestionVote.find_by(question_id: params[:id], users_id: current_user.id)

		# check if Question has been voted by user
		if vote
			if vote.vote == 0
				@message = "You can only vote once per question"
				@question = Question.find(params[:id])
				erb :'questions/show'
			else
				@message = "Your vote has been changed to downvote"
				vote.update(vote: 0)
				redirect to '/questions/' + params[:id].to_s
			end	
		else
			@message = "Your vote will change the future"
			QuestionVote.create(question_id: params[:id], users_id: current_user.id, vote: 0)
		#current_user.question_votes.create()
			redirect to '/questions/' + params[:id].to_s
		end
	else
		@message = "Please login to vote"
		erb :'sessions/new'
	end	
end


