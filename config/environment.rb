ENV['SINATRA_ENV'] ||= "development"
ENV['RAILS_ENV'] = ENV['SINATRA_ENV'] # maybe the migrator is looking for RAILS_ENV

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :environment, ENV['SINATRA_ENV'].to_sym

database_config = {
  :development =>  {
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  }
}

set :database, database_config

require './app/controllers/application_controller'
require_all 'app'
