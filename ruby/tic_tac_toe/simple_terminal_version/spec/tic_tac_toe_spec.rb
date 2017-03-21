require "tic_tac_toe"

describe Game do

	let(:game) {Game.new("Wilbur", "Wilson")}
	
	describe ".initialize" do
		it "assigns names to each player" do
			expect(game.player_x.name).to eq("Wilbur")
			expect(game.player_o.name).to eq("Wilson")
		end
	end
	
	
end