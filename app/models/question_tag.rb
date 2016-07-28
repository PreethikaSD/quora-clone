class QuestionTag < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :tag 
	belongs_to :question 
end
