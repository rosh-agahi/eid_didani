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

  get '/families/user/:id' do
    @user = current_user
    @families = "need to make the household : families membership table first."
    erb :'families/myindex.html'
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

end
