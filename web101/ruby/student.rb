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


a = Array.new + [1,4,33,5,6]
b = String.new + "sup!"
c = Time.new

d = [1,4,33,5,6]
e = "sup!"
f = Time.new

g = f+60

puts 'a = ' +a.to_s
puts 'b = ' +b.to_s
puts 'c = ' +c.to_s
puts 'd = ' +d.to_s
puts 'e = ' +e.to_s
puts 'f = ' +f.to_s

puts f
puts g

puts Time.mktime(2000,1,1)
puts Time.mktime(1988,2,26,10,47)+1000000000

#Ask for someone's birth date and give them x spanks
puts "year?"
year = gets.chomp.to_i

puts "month?"
month = gets.chomp.to_i

puts "day?"
day = gets.chomp.to_i

birthday = Time.mktime(year,month,day)
now_time = Time.new
years_past = (now_time-birthday)/60/60/24/365

puts "SPANK!"*years_past

#Hash or array?

color_array = []
color_hash = {}

color_array[0] = "red"
color_array[2] = "green"
color_array[1] = "blue"
color_hash["exciting_things"] = "red"
color_hash["environment_things"] = "green"
color_hash["wet_things"] = "blue"

color_array.each do |color|
  puts color
end

color_hash.each do |code_type,color|
  puts code_type + ": " + color
end



class Integer
  def to_eng
    if self == 5
      english = "five"
    else
      english = "not five"
    end

    english
  end
end

puts 5.to_eng
puts 33.to_eng



#Making a new class and giving the instances variables

class Dicev1
  def roll
    1 + rand(6)
  end
end

class Dice
  def initialize
    roll
  end
  def roll
    @number_showing = 1 + rand(6)
  end

  def cheat
    @number_showing = 0
    while @number_showing == 0
      @cheat_num = gets.chomp.to_i
      if @cheat_num > 6
        puts "That's too high, try again"
      elsif @cheat_num < 1
        puts "That's too low, try again"
      else
        @number_showing = @cheat_num
      end
    end
  end

  def showing
    @number_showing
  end

end

cheat_dice = Dice.new
puts "Here's a dice, what would you like to roll?"
cheat_dice.cheat
puts "Ok cool, let's see if it worked..."
puts cheat_dice.showing



some_dice = [Dice.new, Dice.new]

some_dice.each do |x|
  x.roll
  puts x.showing
  puts x.showing
  x.roll
  puts x.showing
  puts x.showing
end



#Baby dragon class with variables

class BabyDragon

  def initialize name
    @name = name
    @asleep = false
    @stuff_in_tummy = 10
    @stuff_in_butt = 0

    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}."
    @stuff_in_tummy = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}, he poops!"
    @stuff_in_butt = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to sleep."
    @asleep = true
    
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke"
      end
    end

    if @asleep
      @asleep = false
      puts "#{@name} woke up"
    end

  end

  def toss
    puts "You toss #{@name} up in the air."
    puts "He giggles, and burns your eyebrows off."
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently"
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes up when you stop."
    end
  end

  private

  def hungry?
    @stuff_in_tummy <= 2
  end

  def poopy?
    @stuff_in_butt >= 8
  end

  def passage_of_time
    if @stuff_in_tummy > 0
      @stuff_in_tummy = @stuff_in_tummy -1
      @stuff_in_butt = @stuff_in_butt +1
    else
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} is starving, in desperation he ate YOU!"
      exit
    end

    if @stuff_in_butt >= 10
      @stuff_in_butt = 0
      puts "Whoops! #{@name} had an accident..."
    end

    if hungry?
      if @asleep
        @asleep =  false
        puts "He wakes up with a rumble"
      end
      puts "#{@name}'s tummy grumbles"
    end

    if poopy?
      if @asleep
        @asleep = false
        puts "He wakes up with pffft..."
      end
      puts "#{@name} does the potty dance..."
    end

  end

end


pet = BabyDragon.new "Waffles"
pet.feed
pet.toss
pet.walk
pet.put_to_bed
pet.rock
pet.put_to_bed




#This tree grows and you can interact with it

class FruitTree

  def initialize fruit
    @tallness = 1
    @fruits = 0
    @age = 0
    @fruit_type = fruit

    puts "A new #{@fruit_type} tree has begun to grow!"
  end

  def height
    puts "The tree is #{@tallness} feet tall"
  end

  def pick_fruit
    if @fruits <= 0
      puts "There are no fruit on the tree!"
    else
      @fruits = @fruits - 1
      puts "You ate one orange, there are #{@fruits} left"
      self.count_fruit
    end   
  end

  def enjoy_tree
    puts "You sit and watch the tree grow..."
    one_year_passes
  end

  def count_fruit
    puts "There are #{@fruits} #{@fruit_type}s on the tree"
  end

  private

  def one_year_passes
    @tallness = @tallness + 1
    @age = @age + 1
    if @age > 3
      @fruits = (@fruits + 1) * @age
    end
    if @age > 8
      puts "The tree is old and died..."
      exit
    end
  end


end

tree = FruitTree.new "apple"

#trythis = {"measure" => tree.height, "enjoy" => tree.enjoy_the_tree, "count" => tree.count_fruits, "pick" => tree.pick_fruit}


puts "What would you like to do with the tree loser: height, pick_fruit, enjoy_tree or count_fruit?"
selection = gets.chomp
tree.send selection
puts "What would you like to do with the tree?"
selection = gets.chomp
tree.send selection
puts "What would you like to do with the tree?"
selection = gets.chomp
tree.send selection


#Blocks and procs

do_you_like = Proc.new do |a_thing|
  puts "I really like #{a_thing}!"
end

do_you_like.call "puppies"
do_you_like.call "chickens"

def maybeDo someProc
  if rand(2) == 0
    someProc.call
  end
end

def twiceDo someProc
  someProc.call
  someProc.call
end

wink = Proc.new do
  puts '<wink>'
end

glance = Proc.new do
  puts '<glance>'
end

maybeDo wink
maybeDo glance
twiceDo wink
twiceDo glance


#Methods taking procs as inputs

def doUntilFalse firstInput, someProc
  input  = firstInput
  output = firstInput

  while output
    input  = output
    output = someProc.call input
  end

  input
end

buildArrayOfSquares = Proc.new do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop                         # Take off the last number...
    array.push lastNumber*lastNumber  # ...and replace it with its square...
    array.push lastNumber-1           # ...followed by the next smaller number.
  end
end

alwaysFalse = Proc.new do |justIgnoreMe|
  false
end

puts doUntilFalse([5], buildArrayOfSquares).inspect
puts doUntilFalse('I\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)


#Methods returning procs

def compose proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

squareIt = Proc.new do |x|
  x * x
end

doubleIt = Proc.new do |x|
  x + x
end

doubleThenSquare = compose doubleIt, squareIt
squareThenDouble = compose squareIt, doubleIt

puts doubleThenSquare.call(5)
puts squareThenDouble.call(5)


#Add a method to the array class which takes a block of a proc

class Array
  def eachEven(&wasABlock_nowAProc) #The BLOCK is do |fruit| puts "Yum! I...."end
    # We start with "true" because arrays start with 0, which is even.
    isEven = true

    self.each do |object|
      if isEven
        wasABlock_nowAProc.call object
      end

      isEven = (not isEven)  # Toggle from even to odd, or odd to even.
    end
  end
end

['apple', 'bad apple', 'cherry', 'durian'].eachEven do |fruit|
  puts 'Yum!  I just love '+fruit+' pies, don\'t you?' #This is the BLOCK which will turn into a PROC
end

# Remember, we are getting the even-numbered elements
# of the array, all of which happen to be odd numbers,
# just because I like to cause problems like that.
[1, 2, 3, 4, 5].eachEven do |oddBall|
  puts oddBall.to_s+' is NOT an even number!'
end



def profile description_of_block, &block
  start_time = Time.now

  block.call

  duration = Time.now - start_time

  puts "#{description_of_block} took #{duration} seconds."

end

profile "25000 doublings" do
  number = 1

  25000.times do
    number = number + number
  end

  puts number.to_s.length.to_s+" digits"

end


#Some other proc calling itself from within a method

def doSelfImportantly someProc
  puts 'Everybody just HOLD ON!  I have something to do...'
  someProc.call
  puts 'Ok everyone, I\'m done.  Go on with what you were doing.'
end

sayHello = Proc.new do
  puts 'hello'
end

sayGoodbye = Proc.new do
  puts 'goodbye'
end

doSelfImportantly sayHello
doSelfImportantly sayGoodbye



#Write a grandfather clock that uses a block to DONG for every hour of the day

def grandfather_clock(&dong_block)
  hours_passed_today = Time.now.hour
  if hours_passed_today > 12
    hours_passed_today = hours_passed_today/2
  end

  hours_passed_today.times do
    dong_block.call
  end

end


grandfather_clock do 
  puts "DONG!"
end


#Blocks upon blocks upon blocks

$nesting_depth = 0

def log description_of_block
  puts "  "*$nesting_depth + "Beginning #{description_of_block}..."
  $nesting_depth = $nesting_depth + 1
  somethingweird = yield
  $nesting_depth = $nesting_depth -1
  puts "  "*$nesting_depth + "...#{description_of_block} finished returning: #{somethingweird}"


end


log "outer block" do
  log "some little block" do
    log "teeny tiny block" do
      "lots of love"
    end
    42
  end
  log "yet another block" do
    "I like indian food"
  end
  true
end



#Find the sum of all the multiples of 3 or 5 below 1000.

array_of_multiples = []
final_sum = 0
i = 0

while i < 1001
  if i%3 == 0
    array_of_multiples.push i
    final_sum = final_sum + i
  elsif i%5 == 0
    array_of_multiples.push i
    final_sum = final_sum + i
  end
  i = i+1
end

puts array_of_multiples
puts final_sum
=end

#By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

def fibonacci number_to_reach
  num1 = 1
  num2 = 2
  latest_number = 0
  sum_of_evens = 2

  while latest_number < number_to_reach
    latest_number = num1+num2
    num1 = num2
    num2 = latest_number
    if latest_number%2 == 0
      sum_of_evens = sum_of_evens + latest_number
    end


  end

  puts sum_of_evens

end


fibonacci 4000000








