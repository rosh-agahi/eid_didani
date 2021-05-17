class HouseholdsController < ApplicationController
  before '/households/*'do
    authentication_required
  end

  get '/households/new' do
    erb :"households/new.html"
  end

  # get '/households/:id/manage/:id2' do
  #   @household = Household.find_by_id(params[:id])
  #   @users = @household.users
  #   @availabilities = @household.availabilities
  #   @otheruser = User.find_by_id(params[:id2])
  #
  #   erb :"households/manage.html"
  # end

  post '/households/:id/manage' do
    if !!@otheruser = User.find_by(email: params[:email])
      if !@otheruser.household_id == nil
        flash[:notice2] = "User already has a household. They must leave their household first before joining yours."
        redirect "/households/#{current_user.household.id}/manage"
      else
        redirect "/users/#{@otheruser.email}/addtohousehold"
      end
    else
      flash[:notice2] = "User not found."
      redirect "/households/#{current_user.household.id}/manage"
    end
  end

  get '/households/:id/manage' do #putting it here so that it does this instead of going to /households/:id
    if is_admin?
      @household = Household.find_by_id(params[:id])
      @users = @household.users
      @availabilities = @household.availabilities
      erb :"households/manage.html"
    else
      flash[:notice] = "You are not the admin for the household you tried to access."
      redirect "/"
    end
  end


  get '/households/:id' do
    @household = Household.find_by_id(params[:id])
    @availabilities = @household.availabilities
    erb :"households/show.html"
  end

  post '/households' do
    @household = Household.new
    @household.name = params[:name]
    @household.address = params[:address]
    @household.admin_id = current_user.id
    # set it manually because households and
    # users have a one to many relationship but one user has admin rights to a household.

    if @household.save
      #redirect to another form to update current users's household id.
      redirect "/confirm/#{current_user.id}"
    else
      flash[:notice] = "The Household was not created. Please try again."
      redirect "/housholds/new"
    end

  end




end
