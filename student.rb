=begin
#This is a class I'm defining
class Student
	attr_accessor :first_name, :last_name, :primary_phone_number
	def introduction(target)
		puts "Hi #{target}, I'm #{first_name}"
	end
	def favorite_number
		7
	end
end

bumbum = Student.new
bumbum.first_name = "Bumface"
puts "Fave num is #{bumbum.favorite_number}"
bumbum.introduction("Sofie")

#This is the most basic-bitch math
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

#Getting user input
puts "What's your first name?"
first_name = gets.chomp
puts "What's your last name?"
last_name = gets.chomp
puts "Your name is #{(first_name.length + last_name.length).to_s} is it?"

puts "Favorite num?"
favorite_number = gets.chomp.to_i + 1
puts "How about #{favorite_number}?"

#Moving text around
lineWidth = 50
puts(                "Old mother hubbard".center(lineWidth))
puts(    "Waffles".center(lineWidth))
puts("hi".center(lineWidth))
str ="test is here"
puts str.ljust lineWidth
puts str.center lineWidth
puts str.rjust lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)


line_width = 80
puts "table of contents".center line_width
puts "Ch1 Numbers".ljust(line_width/2) + "pg 2".rjust(line_width/2)
puts "Ch2 Letters".ljust(line_width/2) + "pg 7".rjust(line_width/2)
puts "Ch3 Methods".ljust(line_width/2) + "pg 8".rjust(line_width/2)



#Angry boss always fires you
puts "WHAT DO YOU WANT?"
want = gets.chomp.upcase
puts "YOU WANT #{want}?! YOU'RE FIRED!"

#Everyone sucks but me
puts "tell me your name"
name = gets.chomp
if name == "sofie"
	puts "you are awesome"
else
	puts "you suck"
end

#Irish goodbye
command = ""

while command != "bye"
	command = gets.chomp
	puts "Say bye"
	puts command
end

#Cool booleans (cooleans)
chris = true
sofie = false
waffles = true 
sport = false

puts (chris and waffles)
puts (chris && waffles)
puts (chris && sofie)
puts (chris or sofie)
puts (not sofie)

#99 bottles song loop
bottles = 99
while bottles > 0
	puts "#{bottles} bottles of beer on the wall"
	bottles = bottles-1
end

#Deaf grandma
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



#Find all leap years

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

#This method iterates

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


#This method takes in a bunch of word and returns them sorted
words = []
input = "x"

while input != ""
	puts "Give me a word?"
	input = gets.chomp
	words.push input
end
puts words.sort


def sayMoo number_of_moos
	puts "moooo"*number_of_moos
end

returnVal = sayMoo 5

puts returnVal
=end

#This is a method which turns numbers into english strings

def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)
  left  = number
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    # Now here's a really sly trick:
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

puts englishNumber(  0)
puts englishNumber(  9)
puts englishNumber( 10)
puts englishNumber( 11)
puts englishNumber( 17)
puts englishNumber( 32)
puts englishNumber( 88)
puts englishNumber( 99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)










