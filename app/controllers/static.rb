require 'byebug'
enable :sessions

get '/' do
	@questions = Question.all
	erb :"static/index"
end	


