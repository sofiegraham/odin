module TicTacToe
  class Player
    attr_reader :color, :name
    def initialize(details_hash)
      @color = details_hash.fetch(:color)
      @name = details_hash.fetch(:name)
    end
  end
end
