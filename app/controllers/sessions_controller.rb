enable :sessions

get '/sessions/new' do
	erb :'sessions/new'	
end

post '/sessions' do #logging in
	user = User.authenticate(params[:session][:email], params[:session][:password])
	if user != nil 
		session[:id] = user.id
		redirect to '/'
	else
		session[:errors] = "Invalid email or password"
		erb :'sessions/new'
	end
end

post '/signup' do
	user = User.new(params[:session])
	user.save
	if user.valid?
		redirect '/'
	else
		session[:errors] = user.errors.full_messages
		erb :'sessions/new'
	end
end

post '/logout' do
	session[:id] = nil
	redirect 'sessions/new'
end
