require 'byebug'

class Board
	attr_accessor :board

	def initialize
		@board = []
		array = *(0..7)
		array.each do |x|
			array.each do |y|
				@board << [x,y]
			end
		end
	end

	def on_board?(coordinates)
		@board.include?(coordinates) ? true : false
	end

end


class Knight
	attr_accessor :board, :current, :parent, :possible_moves

	def initialize(board, current, parent=nil)
		@board = board
		@current = current
		@parent = parent
		@possible_moves = calculate_moves(current)
	end

	def calculate_moves(current)
		moves = []
		movements = [[current[0]-1, current[1]+2],[current[0]-1, current[1]-2],
			[current[0]+1, current[1]+2],[current[0]+1, current[1]-2],
			[current[0]-2, current[1]-1],[current[0]-2, current[1]+1],
			[current[0]+2, current[1]-1],[current[0]+2, current[1]+1]]

		movements.each do |coordinates|
			if @board.board.include?(coordinates)
				moves << coordinates
			end
		end
		moves
	end

	def move(target)
		if possible_moves.include? target
			@current = target
			@possible_moves = possible_moves(@current)
		end
	end
end


class Game
	attr_accessor :board

	def initialize
		@board = Board.new
	end

	def knight_moves(current, target)
		been_there = []
		path =[]
		queue = [Knight.new(@board, current)]


		until queue.length == 0
			been_there << queue[0].current
			if queue[0].current == target
				path << queue[0].current
				pointer = queue[0]
				until pointer.parent == nil
					path << pointer.parent.current
					pointer = pointer.parent
				end
				break
			else
				queue[0].possible_moves.each do |current|
					queue << Knight.new(board, current, queue[0]) if !been_there.include?(current)
				end
			end
			queue.shift
		end
		puts "You did it in #{path.length-1} moves"
		print path
	end
end

travail = Game.new

puts travail.knight_moves([3,3],[5,5])