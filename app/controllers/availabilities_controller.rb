class AvailabilitiesController < ApplicationController

  get '/availabilities/new' do
    erb :'availabilities/new.html'
  end

  post '/availabilities' do
    @availability = Availability.new
    @availability.available_date = params[:datetime_local]
    @availability.household_id = current_user.household.id
    @availability.available_status = true

    if @availability.save
      if is_admin?
        redirect "/households/#{@user.household.id}/manage"
      else
        redirect "/households/#{@user.household.id}"
      end
    end

  end

  delete '/availabilities/:id' do
    @availability = Availability.delete(params[:id])

    if is_admin?
      redirect "/households/#{@user.household.id}/manage"
    else
      redirect "/households/#{@user.household.id}"
    end
  end

  get '/schedule' do
    erb :'availabilities/show.html'
  end

end
