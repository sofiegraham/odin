require 'rest-client'
#url = gets.chomp
#puts RestClient.get(url)

#puts RestClient.get('http://localhost:3000/users/1/edit')
puts RestClient.post('http://localhost:3000/users', "")
