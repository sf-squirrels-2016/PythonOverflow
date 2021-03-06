get '/sessions/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/questions"
  else
    erb :login
  end
end

post '/sessions/new' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password_plaintext])
    session[:user_id] = @user.id
    redirect "/questions"
  else
    session.delete(:user_id)
    @error = "Please check your email address and password and try again."
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/sessions/new'
end
