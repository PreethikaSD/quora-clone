class CreateAnswerVotes < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
			t.belongs_to :answers 
			t.belongs_to :users
  			t.integer :vote 
  			t.timestamps	
  		end	
	end
end
