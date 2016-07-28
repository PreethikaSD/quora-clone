class Tag < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :question_tags
	has_many :questions, :through => :question_tags
end
