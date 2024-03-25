require "http/server"

server = HTTP::Server.new [
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
  HTTP::CompressHandler.new,
  HTTP::StaticFileHandler.new("static", directory_listing: false),
], do |context|
  if context.request.path == "/"
    context.response.redirect "/index.html", HTTP::Status::MOVED_PERMANENTLY
  end
end

server.bind_tcp "0.0.0.0", 8080
server.listen
