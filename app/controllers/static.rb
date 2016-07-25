require 'byebug'
enable :sessions

get '/' do
  @messages = session[:errors]
  session[:errors] =nil
  erb :"static/index"
end

get '/profile' do
	erb :"static/profile"
end

post '/signup' do
	user = User.new(params[:user])
	user.save
	if user.valid?
		redirect '/profile'
	else
		session[:errors] = user.errors.full_messages
		redirect '/'
	end
end

post '/login' do
	user = User.find_by(email: params[:user][:email])
	if user && user.authenticate(params[:user][:password])
		session[:id] = user.id
		redirect '/profile'
	else
		session[:errors] = "Invalid username or password"
		redirect '/'
	end
end

post '/logout' do
	session[:id] = nil
	redirect '/'
end

get '/users/:id' do
end