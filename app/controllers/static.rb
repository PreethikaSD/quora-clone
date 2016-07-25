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
	user = User.authenticate(params[:user][:email], params[:user][:password])
	if user != nil 
		session[:id] = user.id
		redirect '/profile'
	else
		session[:errors] = "Invalid email or password"
		redirect '/'
	end
end

post '/logout' do
	session[:id] = nil
	redirect '/'
end

get '/users/:id' do
end