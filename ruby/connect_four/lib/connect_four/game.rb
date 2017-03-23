module ConnectFour
  class Game
    attr_reader :player1, :player2

    def initialize(player1, player2)
      @player1 = Player.new({name: player1, color: "X"})
      @player2 = Player.new({name: player2, color: "Y"})
      @board = Board.new
      @current_player = @player1
      game_loop
    end

    def game_loop
      loop do
        puts "select a move #{@current_player.name}"
        coordinates = select_move
        @board.change_value(coordinates, @current_player.color)
        if @board.win_check
          puts "#{@current_player.name} won"
          exit
        elsif @board.board_full?
          puts "Game over, tie"
          exit
        else
          player_change
        end
      end
    end

    def player_change
      @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def select_move
      coordinates = nil
      valid = false
      until valid
        x = gets.chomp.to_i
        y = gets.chomp.to_i
        valid = @board.valid_move?([x,y]) ? true : false
      end
      coordinates = [x,y]
      coordinates
    end

  end

end
