class Game
	attr_accessor :player_x, :player_o, :board, :current_player, :game_status

	def initialize(player1, player2)
		@player_x = Player.new(player1, "X")
		@player_o = Player.new(player2, "O")
		@board = {
			:x0 => " ", :x1 => "1", :x2 => "2", :x3 => "3",
			:a0 => "A", :a1 => "▢", :a2 => "▢", :a3 => "▢",
			:b0 => "B", :b1 => "▢", :b2 => "▢", :b3 => "▢",
			:c0 => "C", :c1 => "▢", :c2 => "▢", :c3 => "▢"
		}
		@current_player = @player_x
		@game_status = "playing"
	end

	def show_board(board)
		system "clear"
		puts "#{board[:x0]} #{board[:x1]} #{board[:x2]} #{board[:x3]}"
		puts "#{board[:a0]} #{board[:a1]} #{board[:a2]} #{board[:a3]}"
		puts "#{board[:b0]} #{board[:b1]} #{board[:b2]} #{board[:b3]}"
		puts "#{board[:c0]} #{board[:c1]} #{board[:c2]} #{board[:c3]}"
	end

	class Player
		attr_reader :name, :sigil
		def initialize(name, sigil)
			@name = name
			@sigil = sigil
		end
	end

	def game_loop
		while @game_status == "playing"
			error = ""
			selection_made = false
			while selection_made == false

				show_board(@board)
				puts "#{error}#{@current_player.name}, select a square."
				input = gets.chomp.downcase.to_sym
				
				if @board[input] == "▢"
					@board[input] = @current_player.sigil
					selection_made = true
				else
					error = "You can't go there buttface! Now, "
				end
			end

			if win_check(@board, @current_player)
				show_board(@board)
				puts "#{@current_player.name} wins"
				@game_status = "won"
				exit
			else
				if @board.values.any? { |value| value == "▢"  }
					@current_player = @current_player==@player_x ? @player_o : @player_x
				else
					show_board(@board)
					puts "Its a tie..."
					@game_status = "tie"
					exit
				end	
			end
		end
	end

	def win_check(board, current_player)
		if
			(board[:a1] == current_player.sigil && board[:a2] == current_player.sigil && board[:a3] == current_player.sigil) ||
			(board[:b1] == current_player.sigil && board[:b2] == current_player.sigil && board[:b3] == current_player.sigil) ||
			(board[:c1] == current_player.sigil && board[:c2] == current_player.sigil && board[:c3] == current_player.sigil) ||
			(board[:a1] == current_player.sigil && board[:b1] == current_player.sigil && board[:c1] == current_player.sigil) ||
			(board[:a2] == current_player.sigil && board[:b2] == current_player.sigil && board[:c2] == current_player.sigil) ||
			(board[:a3] == current_player.sigil && board[:b3] == current_player.sigil && board[:c3] == current_player.sigil) ||
			(board[:a1] == current_player.sigil && board[:b2] == current_player.sigil && board[:c3] == current_player.sigil) ||
			(board[:a3] == current_player.sigil && board[:b2] == current_player.sigil && board[:c1] == current_player.sigil)
			true
		else
			false
		end
	end

end