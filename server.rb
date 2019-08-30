require "sinatra"
require "sinatra/activerecord"

class Server < Sinatra::Base
    get '/' do
        erb :index
    end
end