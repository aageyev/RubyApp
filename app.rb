require 'yaml'
require 'socket'                            # Get sockets from stdlib
config = YAML.load_file("#{File.dirname(__FILE__)}/config.yml")

server = TCPServer.new(config["http_port"]) # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  resp = "<html>Hello!</html>"
  headers = ["HTTP/1.1 200 OK",
             "Date: Tue, 14 Dec 2010 10:48:45 GMT",
             "Server: Ruby",
             "Content-Type: text/html; charset=iso-8859-1",
             "Content-Length: #{resp.length}\r\n\r\n"].join("\r\n")
  client.puts headers          # Send the time to the client
  client.puts resp
  client.close                 # Disconnect from the client
}
