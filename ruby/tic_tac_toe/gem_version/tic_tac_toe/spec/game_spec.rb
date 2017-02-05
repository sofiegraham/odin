require_relative "spec_helper"

module TicTacToe
  describe Game do

    let (:sofie) { Player.new({color: "X", name: "sofie"}) }
    let (:connor) { Player.new({color: "O", name: "connor"}) }

    context "#initialize" do
      it "randomly selects a current player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [sofie, connor] }
        game = Game.new([sofie, connor])
        expect(game.current_player).to eq sofie
      end

      it "randomly selects an 'other player'" do
        allow_any_instance_of(Array).to receive(:shuffle) { [sofie, connor] }
        game = Game.new([sofie, connor])
        expect(game.other_player).to eq connor
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([sofie, connor])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        game = Game.new([sofie, connor])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new([sofie, connor])
        allow(game).to receive(:current_player) { sofie }
        expected = "sofie: Choose 1-9 to make a move"
        expect(game.solicit_move).to eq expected
      end
    end

    context "#get_move" do
      it "converts a human move of '1' to [0, 0]" do
        game = Game.new([sofie, connor])
        expect(game.get_move("1")).to eq [0, 0]
      end

      it "converts a human move of '7' to [0, 2]" do
        game = Game.new([sofie, connor])
        expect(game.get_move("7")).to eq [0, 2]
      end
    end

    context "#game_over_message" do
      it "returns '{current player name} won!' if board shows a winner" do
        game = Game.new([sofie, connor])
        allow(game).to receive(:current_player) { sofie }
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq "sofie won!"
      end

      it "returns 'The game ended in a tie' if board shows a draw" do
        game = Game.new([sofie, connor])
        allow(game).to receive(:current_player) { bob }
        allow(game.board).to receive(:game_over) { :draw }
        expect(game.game_over_message).to eq "The game ended in a tie"
      end
    end

  end
end
