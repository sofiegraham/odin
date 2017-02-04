#This class contains information for the entire dungeon, and accesses the player.
class Dungeon
	attr_accessor :player

	#Create the player and the rooms array.
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	#Adds rooms to the dungeon.
	def add_room(reference, name, description, connections)
		@rooms << Room.new(reference, name, description, connections)
	end

	#Defines the start location for the player.
	def start(location)
		@player.location = location
		show_current_description
	end

	#Shows the description of the player's location.
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	#Finds a location in the dungeon based on a reference.
	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference}
	end

	#Finds a location in the dungeon that is connected in a specified direction.
	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end

	#Makes the player move to a new location, using a direction.
	def go(direction)
		puts "You go #{direction}"
		@player.location = find_room_in_direction(direction)
		show_current_description
	end

	#This class strores information about the player.
	class Player
		attr_accessor :name, :location

		#Create a player object and store their name.
		def initialize(name)
			@name = name
		end
	end

	#This class stores information about rooms.
	class Room
		attr_accessor :reference, :name, :description, :connections

		#Create a room object and store it's reference, name, description and connections.
		def initialize(reference, name, description, connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		#Print the full description of the room to the screen.
		def full_description
			puts "#{@name}. You are in #{@description}."
		end
	end


end


daggerfall = Dungeon.new("Sofie Jo")

daggerfall.add_room(:small_cave, "Small Cave", "a tiny little cave", {:east => :large_cave})

daggerfall.add_room(:large_cave, "Large Cave", "a big cavernous cave", {:west => :small_cave})

daggerfall.start(:large_cave)

daggerfall.show_current_description

daggerfall.go(:west)

daggerfall.go(:east)