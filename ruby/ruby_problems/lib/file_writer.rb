=begin
fname = "sample.txt"
somefile = File.open(fname, "a") #change a to w to write instead of append
#somefile.puts "waddles!"
somefile.close

file = File.open("sample.txt", "r")
contents = file.read
puts contents
file.close

File.open("sample.txt").readlines.each do |line|
   puts line
end

file = File.open("sample.txt", 'r')
until file.eof?
   line = file.readline
   puts line
end
=end

#This writes (or overwrites) a new file with text from a webpage.
#Then it reads all the lines beginning with "Ham." ignoring spaces.
require "rubygems"
require "rest-client"
require "open-uri"

wiki_url = "http://en.wikipedia.org/"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
	file.write(RestClient.get(wiki_url))
end

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
file_name = "hamlet.txt"
File.open(file_name, "w") { |file| file.write(open(url).read)}


File.open(file_name, "r") do |file|
	file.readlines.each_with_index do |line, idx|
		puts line if line.gsub(/\s+/, "").start_with? "Ham."
	end
end

