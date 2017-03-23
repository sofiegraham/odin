require 'spec_helper'

module ConnectFour
  describe Game do

    let(:game) {Game.new("Sofie","Connor")}

    context "#initialize" do
      it "is initialized with two players" do
        expect(game.player1.name).to eq("Sofie")
      end
    end
    context ".player_change" do
      it "returns the player which is not the current player" do
        expect(game.player_change).to eq(game.player2)
      end
    end
  end

end
