require 'socket'

server = TCPServer.open(2000) 	# Socket to listen on port 2000 (like File.open)
loop do							# Servers run forever
	Thread.start(server.accept) do |client|
		client.puts(Time.now.ctime)	# Send time to client
		client.puts "Closing the connection now, bye!"
		client.close				# Disconnect from client
	end
end