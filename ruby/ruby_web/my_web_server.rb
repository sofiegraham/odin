require 'socket'
require 'uri'

WEB_ROOT = './sofiefiles' # This is the directory where files will be served

CONTENT_TYPE_MAPPING = {
	'html' => 'text/html',
	'txt' => 'text/plain',
  	'png' => 'image/png',
  	'jpg' => 'image/jpeg'
}

DEFAULT_CONTENT_TYPE = 'application/octet-stream' # Treat as binary if content type not listed in mapping

def content_type(path) # Translates the URI request into a local file type
	extension = File.extname(path).split(".").last
	CONTENT_TYPE_MAPPING.fetch(extension, DEFAULT_CONTENT_TYPE)
end

def requested_path(request_line) # Request looks something like this: GET /index.html?utm_source=stupid_parameter HTTP/1.1
	request_uri = request_line.split(" ")[1] # The URI, like 'index.html' comes after GET or POST or HEAD
	path = URI.unescape(URI(request_uri).path) # Gets rid of the parameters on the URI

	File.join(WEB_ROOT, path) # A file object representing the URI request - now we can see if we have the file locally!
end

server = TCPServer.open('localhost', 2000) 	# Socket to listen on port 2000 (like File.open)

loop do										# Servers run forever
	socket = server.accept					# Wait until client connects and return a TCPSocket
	request_line = socket.gets					# read the 'request line' from the socket (see here: http://www.jmarshall.com/easy/http/#whatis)
	path = requested_path(request_line)
	STDERR.puts request_line						# Just for debugging - log to console
	
	if File.exist?(path) && !File.directory?(path)	# Check if file exists AND is not a directory
		File.open(path, "rb") do |file|
			socket.print "HTTP/1.1 200 OK\r\n" +	# Including response status, content type, and size. The \r\n is called CRLF and must be at the end of each line
						"Content-Type: #{content_type(file)}\r\n" + # Uses the MAPPING to determine type
						"Content-Length: #{file.size}\r\n" + # Determines size of file
						"Connection: close\r\n"
			socket.print "\r\n"						# Just printing a blank line to seperate the header from response body

			IO.copy_stream(file, socket)			# Write contents of file to socket
		end
	else
		message = "File not found\n"
		socket.print "HTTP/1.1 404 Not found\r\n" +	
					"Content-Type: text/plain\r\n" +
					"Content-Length: #{message.size}\r\n" +
					"Connection: close\r\n"
		socket.print "\r\n"						# Just printing a blank line to seperate the header from response body

		socket.print message
	end
	socket.close							# Disconnect from client/socket
end