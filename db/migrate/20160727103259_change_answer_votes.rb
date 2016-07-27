class ChangeAnswerVotes < ActiveRecord::Migration
	def change
		rename_column :answer_votes, :answers_id, :answer_id
	end
end
