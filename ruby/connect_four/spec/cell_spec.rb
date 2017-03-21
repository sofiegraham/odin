require "spec_helper"

module ConnectFour
	describe Cell do
		context "#initialize" do
			it "is initialized with :empty by default" do
				cell = Cell.new
				expect(cell.value).to eq(:empty)
			end
			it "can be initialized with a value of 'X'" do
				cell = Cell.new("X")
				expect(cell.value).to eq "X"
			end
		end
		it "can have it's value changed" do
			cell = Cell.new
			cell.value = "changed"
			expect(cell.value).to eq("changed")
		end
	end
end
