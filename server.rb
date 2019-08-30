require "sinatra"
require "sinatra/activerecord"

class Server < Sinatra::Base
    get '/' do
        erb :index
    end

    get "/boards" do
        erb :boards, locals: {boards: Board.all}
    end
end