post '/answers/:id/upvote' do
	if logged_in?
		vote = AnswerVote.find_by(answer_id: params[:id], users_id: current_user.id)
		# check if Question has been voted by user
		if vote
			if vote.vote == 1
				@message = "You can only vote once per answer"
				@answer = Answer.find(params[:id])

				@question = Question.find(Answer.find(params[:id]).question_id)
				erb :'questions/show'
			else
				@message = "Your answer vote has been changed to upvote"
				vote.update(vote: 1)
				@question = Question.find(Answer.find(params[:id]).question_id)				
				#redirect to '/answers/' + params[:id].to_s
				erb :'questions/show'
			end	
		else
			@message = "Your vote will change the future"
			AnswerVote.create(answer_id: params[:id], users_id: current_user.id, vote: 1)
			#current_user.question_votes.create()
			@question = Question.find(Answer.find(params[:id]).question_id)
			erb :'questions/show'
		end
	else
		@message = "Please login to vote"
		erb :'sessions/new'
	end	
end

post '/answers/:id/downvote' do
	if logged_in?
		vote = AnswerVote.find_by(answer_id: params[:id], users_id: current_user.id)

		# check if Question has been voted by user
		if vote
			if vote.vote == 0
				@message = "You can only vote once per answer"
				@answer = Answer.find(params[:id])
				@question = Question.find(Answer.find(params[:id]).question_id)
				erb :'questions/show'
			else
				@message = "Your answer vote has been changed to downvote"
				@answer = Answer.find(params[:id])
				vote.update(vote: 0)
				@question = Question.find(Answer.find(params[:id]).question_id)
				#redirect to '/answers/' + params[:id].to_s
				erb :'questions/show'
			end	
		else
			@message = "Your vote will change the future"
			AnswerVote.create(answer_id: params[:id], users_id: current_user.id, vote: 0)
		#current_user.question_votes.create()
			@question = Question.find(Answer.find(params[:id]).question_id)
			#redirect to '/answers/' + params[:id].to_s
			erb :'questions/show'
		end
	else
		@message = "Please login to vote"
		erb :'sessions/new'
	end	
end


