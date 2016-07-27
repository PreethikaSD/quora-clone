class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.belongs_to :question
			t.belongs_to :users
  			t.integer :vote 
  			t.timestamps	
  		end	
	end
end
