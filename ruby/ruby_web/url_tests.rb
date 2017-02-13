require "net/http"

url = URI.parse("http://www.rubyinside.com/test.txt")

response = Net::HTTP.get_response(url) #GOOD, LESS FLEXIBLE. Uses url var to get response from file
puts response.body

Net::HTTP.start(url.host, url.port) do |http| #GOOD. Uses the url var to go directly to the file
	req = Net::HTTP::Get.new(url.path)
	puts http.request(req).body
end

Net::HTTP.start("www.rubyinside.com") do |http| #OK. Opens connection with server, passes file anem in and reads it.
	req = Net::HTTP::Get.new("/test.txt")
	puts http.request(req).body
end

def get_web_document(url)
	uri = URI.parse(url)
	response = Net::HTTP.get_response(uri)

	case response
	when Net::HTTPSuccess
		return response.body
	when Net::HTTPRedirection
		return get_web_document(response["Location"])
	else
		return nil
	end
end

puts get_web_document("http://www.rubyinside.com/test.txt")
puts get_web_document("http://www.rubyinside.com/non-existent")
puts get_web_document("http://www.rubyinside.com/redirect-test")

#####

auth_url = URI.parse("http://browserspy.dk/password-ok.php")

Net::HTTP.start(auth_url.host, auth_url.port) do |http| #This one uses a name and password to access the site.
	req = Net::HTTP::Get.new(auth_url.path)
	req.basic_auth("test", "test")
	puts http.request(req).body
end

#####

form_url = URI.parse("http://www.rubyinside.com/test.cgi")

response = Net::HTTP.post_form(form_url, {"name" => "Sofie", "age" => 28})
puts response.body


#### Secure HTTP - HTTPS

require "net/http"
require "net/https"

secure_url = URI.parse("https://example.com/")

http = Net::HTTP.new(secure_url.host, secure_url.port) #How to switch on SSL for HTTPS sites
http.use_ssl = true if secure_url.scheme == "https"

request = Net::HTTP::Post.new(secure_url.path)
request.set_form_data({ "credit_card_number" => "12345456728282"})
puts http.request(request).body


#### OPEN URI is net/http, net/https and net/ftp combined (although slightly less flexible)
require "open-uri"

f = open("http://www.rubyinside.com/test.txt")
puts f.readlines.join
puts "This document is #{f.length} bytes in length"
puts f.content_type
puts f.charset
puts f.last_modified

puts URI.parse("http://www.rubyinside.com/test.txt").open.read

open("http://www.rubyinside.com/test.txt") do |f|
	puts f.readlines.join
end

#### Parsing XML documents

require "rexml/document"

xml = <<END_XML
<people>
	<person>
		<name>Sofie Graham</name>
		<name>Sofie Jo</name>
		<gender>Unknown</gender>
	</person>
	<person>
		<name>Waffle Cakes</name>
		<gender>Male</gender>
	</person>
</people>
END_XML

tree = REXML::Document.new(xml)

tree.elements.each("people/person") do |person|
	puts person.get_elements("name").first
end

#### RSS feeds

require "feedjira"

feed = Feedjira::Feed.fetch_and_parse("http://www.rubyinside.com/feed")

puts "This feed's title is #{feed.title}"
puts "This feed's website is #{feed.url}"

feed.entries.each do |item|
	puts item.title + "\n---\n" + item.summary + "\n\n"
end
