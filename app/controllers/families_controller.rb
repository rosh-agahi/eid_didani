class FamiliesController < ApplicationController
  use Rack::MethodOverride

  before '/families*' do
    authentication_required
  end

  get '/families' do
    erb :'families/index.html'
  end

  get '/families/new' do
    erb :'families/new.html'
  end

  get '/families/:id/join' do
    @family = Family.find_by_id(params[:id])
    erb :'families/join.html'
  end

  get '/families/user/:id' do
    @user = current_user
    @families = "need to make the household : families membership table first."
    erb :'families/myindex.html'
  end

  post '/families/:id/join' do
    @family = Family.find_by_id(params[:id])
    @user_input = params[:secret_join_code]

    if @user_input = @family.secret_join_code
      Membership.create(
        household_id: current_user.household_id,
        family_id: @family.id
      )
      flash[:notice] = "You have joined the #{@family.name} family!"
      redirect '/families'
    else
      flash[:notice] = "The secret join code you entered was incorrect."
      redirect "/families/#{@family.id}/join"
    end
  end


  post '/families' do
    @family = Family.new
    @family.name = params[:name]
    @family.secret_join_code = params[:secret_join_code]
    @family.admin_id = current_user.id
    # set it manually because households and
    # users have a one to many relationship but one user has admin rights to a household.

    if @family.save
      #redirect to another form to update current users's household id.
      redirect "/families"
    else
      flash[:notice] = "The Family Group was not created, please try again."
      redirect "/families/new"
    end

  end

  get '/families/:id' do
    #check if user is in the family first!
    @family = Family.find_by_id(params[:id])

  end
end
