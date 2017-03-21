require 'spec_helper'

module ConnectFour
  describe Game do

    let(:game) {Game.new("Sofie","Connor")}
    
    context "#initialize" do
      it "is initialized with two players" do
        expect(game.player1.name).to eq("Sofie")
      end
    end
  end

end
