class Game

	def initialize(player1, player2)
		@player_x = Player.new(player1, "X")
		@player_o = Player.new(player2, "O")
		@grid = {
			:x0 => " ", :x1 => "1", :x2 => "2", :x3 => "3",
			:a0 => "A", :a1 = "▢", :a2 = "▢", :a3 = "▢",
			:b0 => "B", :b1 = "▢", :b2 = "▢", :b3 = "▢",
			:c0 => "C", :c1 = "▢", :c2 = "▢", :c3 => "▢"
		}
		@board = Array.new(3) { Array.new(3,"▢") }
		@current_player = @player_x
		self.take_turn
	end

	def show_board(board)
		system "clear"
		puts board[0].join(" ")
		puts board[1].join(" ")
		puts board[2].join(" ")
	end

	class Player
		attr_reader :name, :sigil

		def initialize(name, sigil)
			@name = name
			@sigil = sigil
		end
	end

	def take_turn
		number_of_turns = 0
		while number_of_turns < 10
			show_board(@board)
			puts "#{@current_player.name}, select a square."
			input = gets.chomp.to_i
			case input
			when 0
				if @board[0][0] != "▢"
					@board[0][0] = @current_player.sigil
				else
					puts "You can't go there you ass badger."
				end
			when 1 then @board[0][1] = @current_player.sigil
			when 2 then @board[0][2] = @current_player.sigil
			when 3 then @board[1][0] = @current_player.sigil
			when 4 then @board[1][1] = @current_player.sigil
			when 5 then @board[1][2] = @current_player.sigil
			when 6 then @board[2][0] = @current_player.sigil
			when 7 then @board[2][1] = @current_player.sigil
			when 8 then @board[2][2] = @current_player.sigil
			else puts "Fine, your turn get's skipped, LOSER!"
			end

			if win_check(@board, @current_player)
				show_board(@board)
				puts "#{@current_player.name} wins"
				exit
			else
				@current_player = @current_player==@player_x ? @player_o : @player_x
				
			end
			number_of_turns += 1
		end
		puts "Too many turns - stop it!"
	end

	def win_check(board, current_player)
		if
			(board[0][0] == current_player.sigil && board[0][1] == current_player.sigil && board[0][2] == current_player.sigil) ||
			(board[1][0] == current_player.sigil && board[1][1] == current_player.sigil && board[1][2] == current_player.sigil) ||
			(board[2][0] == current_player.sigil && board[2][1] == current_player.sigil && board[2][2] == current_player.sigil) ||
			(board[0][0] == current_player.sigil && board[1][0] == current_player.sigil && board[2][0] == current_player.sigil) ||
			(board[0][1] == current_player.sigil && board[1][1] == current_player.sigil && board[2][1] == current_player.sigil) ||
			(board[0][2] == current_player.sigil && board[1][2] == current_player.sigil && board[2][2] == current_player.sigil) ||
			(board[0][0] == current_player.sigil && board[1][1] == current_player.sigil && board[2][2] == current_player.sigil) ||
			(board[0][2] == current_player.sigil && board[1][1] == current_player.sigil && board[2][0] == current_player.sigil)
			true
		else
			false
		end
	end

end

new_game = Game.new("Sofie", "Connor")
