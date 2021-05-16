require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "eiddidaniapp-1234"

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do # sinatra helpers are methods accessible to all views and controllers of the application (aka shared backend functionality)
    def logged_in?
      !!current_user # hardens the true or false value return of current_user
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
      # right side: if @user is not populated, if there is a session id, find the matching user id and assign it to @user.
    end

    def is_admin? #checks if the current_user is admin for the household. required for manage household.
      current_user.id == current_user.household.admin_id
    end

    def authentication_required
      if !logged_in?
        flash[:notice] = "You must be logged in."
        redirect '/login'
      end
    end

    def admin_authication
      if !is_admin?
        flash[:notice] = "You are not the admin for your household. Please contact your household admin."
        redirect '/'

      end
    end

    def display_availability(date_time)
      "#{date_time.strftime("%A %m/%d/%Y %I:%M")} #{date_time.strftime("%H").to_i > 12 ? ('PM') : ('AM')}"
    end

  end

end
