enable :sessions

get '/' do
	@questions = Question.all.paginate(page: params[:page], per_page: 3)
	erb :"static/index"
end	

get '/profile' do
	
	erb :"static/profile"
end
