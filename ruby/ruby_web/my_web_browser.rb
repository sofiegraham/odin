=begin
require 'socket'
 
host = 'localhost'     				 # The web server
port = 2000                          # The port my_web_server is running on
path = "/index.html"                 # The file we want 

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.1\r\n"   # For server which doesn't include the host "GET #{path} HTTP/1.1\r\n"Host: #{host}\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print headers #NOT html headers, this is the request headers, received from the server!
print body                          # And display it
=end
###########

require 'socket'
require 'json'
 
host = 'localhost'     				 # The web server
port = 2000                          # The port my_web_server is running on
path = "/thanks.html"                 # The file we want 

hash_post = {:viking => {:name=>"Erik the Red", :email=>"erikthered@theodinproject.com"} }


request = "POST #{path} HTTP/1.1\r\n" + # For server which doesn't include the host "GET #{path} HTTP/1.1\r\n"Host: #{host}\r\n\r\n"
		"From: sofie@graham.com\r\n" +
		"User-Agent: HTTPTool/1.0\r\n" +
		"Content-Length: #{(hash_post.to_json).size}\r\n" +
		"\r\n" +
		"#{hash_post.to_json}\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print headers #NOT html headers, this is the request headers, received from the server!
print body                          # And display it
