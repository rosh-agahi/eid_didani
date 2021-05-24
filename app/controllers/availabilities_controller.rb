class AvailabilitiesController < ApplicationController
  use Rack::MethodOverride

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
        flash[:notice_green]="Availability added"
        redirect "/households/#{@user.household.id}/manage"
      else
        redirect "/households/#{@user.household.id}"
      end
    end

  end

  patch '/availabilities/:id/book' do
    @host_availability = Availability.find_by_id(params[:id])
    @host_availability.update(other_household_id: params[:other_household_id])
    @host_availability.update(available_status: false)
    @host_availability.update(role: "Host")

    if current_user.household.availabilities.find_by(available_date: @host_availability.available_date)
      @guest_availability = current_user.household.availabilities.find_by(available_date: @host_availability.available_date)
      @guest_availability.update(other_household_id: @host_availability.household.id)
      @guest_availability.update(available_status: false)
      @guest_availability.update(role: "Guest")
    else
      Availability.create(
        household_id: current_user.household,
        available_date: @host_availability.available_date,
        available_status: false,
        other_household_id: @host_availability.household,
        role: "Guest"
      )
    end


    flash[:notice_green] = "Eid Didani was booked with #{@host_availability.household.name}."
    redirect '/families'
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
