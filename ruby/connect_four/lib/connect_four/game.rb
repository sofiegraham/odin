module ConnectFour
  class Game
    attr_reader :player1, :player2

    def initialize(player1, player2)
      @player1 = Player.new({name: player1, color: "X"})
      @player2 = Player.new({name: player2, color: "Y"})
      #set starting player
    end

    def game_loop
      #player selects empty spot
      #empty spot is changed
      #win check
      #board full check
      #player rotation
    end


  end

end
