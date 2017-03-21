require "spec_helper"

module ConnectFour
  describe Player do
    context "#initialize" do
      it "is initialized with the name from the input hash" do
        player = Player.new({name: "Sofie", color: "X"})
        expect(player.name).to eq("Sofie")
      end
      it "is initialized with the color from the input hash" do
        player = Player.new({name: "Sofie", color: "X"})
        expect(player.color).to eq("X")
      end
    end
  end
end
