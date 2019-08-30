require "sinatra"
require "sinatra/activerecord"
require "sinatra-websocket"

class Server < Sinatra::Base
  set :sockets, Array.new

  get "/" do
    erb :index
  end

  get "/socket" do
    request.websocket do |ws|
      ws.onopen do
        settings.sockets << ws
      end

      ws.onmessage do |msg|
        EM.next_tick { settings.sockets.each { |socket| socket.send(msg) } }
      end

      ws.onclose do
        settings.sockets.delete(ws)
      end
    end
  end
end
