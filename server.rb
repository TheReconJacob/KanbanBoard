require "sinatra"
require "sinatra/activerecord"
require "sinatra-websocket"
require_relative "./lib/users.rb"
require_relative "./lib/tasks.rb"
require_relative "./lib/boards.rb"

class Server < Sinatra::Base
  set :sockets, Array.new

  get "/" do
    erb :index
  end

  get "/socket/:board_id" do |board_id|
    request.websocket do |ws|
      ws.onopen do
        settings.sockets << ws
      end

      ws.onmessage do |msg|
        p msg
        # EM.next_tick { settings.sockets.each { |socket| socket.send(msg) } }
        usersname, title, description = msg.split("|")
        user = User.create(:name => usersname)
        Task.create(title: title, description: description, user_id: user.id, board_id: board_id)
      end

      ws.onclose do
        settings.sockets.delete(ws)
      end
    end
  end
end
