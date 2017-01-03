=begin
class Student
	attr_accessor :first_name, :last_name, :primary_phone_number
	def introduction(target)
		puts "Hi #{target}, I'm #{first_name}"
	end
	def favorite_number
		7
	end
end

frank = Student.new
frank.first_name = "Frank"
puts "Fave num is #{frank.favorite_number}"
frank.introduction("Sofie")

puts "Hours in year:"
puts 365*24
puts "minutes in decade:" 
puts 10*365*24*60
puts "seconds old I am:" 
puts 28*365*24*60*60
puts 1246000000/60/60/24/365

puts "hello"

my_string = "Hello there nelly!"
puts my_string*2


puts "What's your first name?"
first_name = gets.chomp
puts "What's your last name?"
last_name = gets.chomp
puts "Your name is #{(first_name.length + last_name.length).to_s} is it?"

puts "Favorite num?"
favorite_number = gets.chomp.to_i + 1
puts "How about #{favorite_number}?"


lineWidth = 50
puts(                "Old mother hubbard".center(lineWidth))
puts(    "Waffles".center(lineWidth))
puts("hi".center(lineWidth))
str ="test is here"
puts str.ljust lineWidth
puts str.center lineWidth
puts str.rjust lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)


puts "WHAT DO YOU WANT?"
want = gets.chomp.upcase
puts "YOU WANT #{want}?! YOU'RE FIRED!"

line_width = 80
puts "table of contents".center line_width
puts "Ch1 Numbers".ljust(line_width/2) + "pg 2".rjust(line_width/2)
puts "Ch2 Letters".ljust(line_width/2) + "pg 7".rjust(line_width/2)
puts "Ch3 Methods".ljust(line_width/2) + "pg 8".rjust(line_width/2)


puts "tell me your name"
name = gets.chomp
if name == "sofie"
	puts "you are awesome"
else
	puts "you suck"
end

command = ""

while command != "bye"
	command = gets.chomp
	puts command
end


chris = true
sofie = false
waffles = true 
sport = false

puts (chris and waffles)
puts (chris && waffles)
puts (chris && sofie)
puts (chris or sofie)
puts (not sofie)


bottles = 99
while bottles > 0
	puts "#{bottles} bottles of beer on the wall"
	bottles = bottles-1
end

#Program: Deaf grandma
bye_count = 0

puts "WHAT'S UP SONNY?"



while bye_count < 3
	question = gets.chomp
	if question != question.upcase
		bye_count = 0
		puts "WHAT? SPEAK UP!"
	elsif question == "BYE"
		bye_count = bye_count+1
		puts "WAIT WHERE ARE YOU GOING?"
	else
		bye_count = 0
		year = (1930 + rand(50))
		puts "NO, NOT SINCE #{year}!"
		puts "WHAT ELSE?"
	end
end

puts "OK GOODBYE"



#Program: Find all leap years

starting_year = 1900
ending_year = 2000



while starting_year <= ending_year
	if((starting_year%400) == 0)
		puts starting_year
	elsif((starting_year%4) == 0)
		if((starting_year%100) != 0)
			puts starting_year
		end
	end
	starting_year = starting_year+1
end


languages = ["English","Ruby","Python"]

languages.each do |lang|
	puts "I love #{lang}"
	puts "Don't you?"
end

puts languages
puts languages.to_s
puts languages.join(", ")
puts languages.join(" :) ") + " 8)"

10.times do
	puts [languages]
end
=end


words = []
input = "x"

while input != ""
	puts "Give me a word?"
	input = gets.chomp
	words.push input
end
puts words.sort

if((words[1].chars.first) > (words[2].chars.first))
	puts words[1].chars.first
else
	puts (words[2].chars.first)
end













