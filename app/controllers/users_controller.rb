class UsersController < ApplicationController
  use Rack::MethodOverride

  get '/register' do
    erb :'users/new.html'
  end

  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      erb :'users/new.html'
    end

  end

  get '/login' do
    erb :'users/login.html'
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id # puts their user id in the session object
      if @user.household_id == nil
        redirect "/households/new"
      elsif @user.household.admin_id == @user.id
        redirect "/households/#{@user.household.id}/manage"
      else
        redirect "/"
      end
      #need to put something in their cookie or session to show that they're logged in.
    else
      erb :'users/login.html'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    erb :'users/show.html'
  end

  get '/confirm/:id' do
    @user = User.find_by_id(params[:id])
    @household = Household.find_by(admin_id: @user.id)
    erb :'users/confirm.html'
  end

  patch '/confirm/:id' do #edit action that updates the household_id for the user using hidden form.
    @user = User.find_by_id(params[:id])
    @user.update(household_id: params[:household_id].to_i)
    redirect "/households/#{@user.household.id}/manage"
  end

  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    erb :'users/edit.html'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
