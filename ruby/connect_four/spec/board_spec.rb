require "spec_helper"

module ConnectFour
  describe Board do

    let(:board) {Board.new}
    let(:horizontal_winning_board) do
      board = Board.new
      board.change_value([2,2],"X")
      board.change_value([2,3],"X")
      board.change_value([2,4],"X")
      board.change_value([2,5],"X")
      board
    end
    let(:vertical_winning_board) do
      board = Board.new
      board.change_value([2,1],"Y")
      board.change_value([3,1],"Y")
      board.change_value([4,1],"Y")
      board.change_value([5,1],"Y")
      board
    end

    let(:full_board) do
      board = Board.new
      board.grid.each do |row|
        row.each do |cell|
          cell.value = "Y"
        end
      end
      board
    end

    context "#initialize" do
      it "has an Array as it's grid" do
        expect(board.grid).to be_a_kind_of(Array)
      end
    end
    context ".default_grid" do
      it "is 6 cells deep" do
        expect(board.grid.length).to eq(6)
      end
      it "is 7 cells wide" do
        expect(board.grid[0].length).to eq(7)
      end
    end
    context ".on_board?" do
      it "returns true if [0,0] cell exists on the board" do
        expect(board.on_board?([0,0])).to eq(true)
      end
      it "returns true if [4,5] cell exists on the board" do
        expect(board.on_board?([4,5])).to eq(true)
      end
      it "returns nil if not on board" do
        expect(board.on_board?([9,9])).to eq(false)
      end
    end
    context ".coordinates_to_cell" do
      it "returns the cell when the coordinates map to a cell" do
        expect(board.coordinates_to_cell([0,0])).to be_a_kind_of(Cell)
      end
      it "returns BoardError when the coordinates do not map to a cell" do
        expect(board.coordinates_to_cell([9,9])).to be_a_kind_of(BoardError)
      end
    end
    context ".cell_value" do
      it "returns the cell's value" do
        board.grid[0][0].value = "testing"
        expect(board.cell_value([0,0])).to eq("testing")
      end
    end
    context ".change_value" do
      it "alters the value of the cell" do
        board.change_value([0,0],"party")
        expect(board.cell_value([0,0])).to eq("party")
      end
    end
    context ".horizontal_check" do
      it "returns the winning value if a horizontal connect 4 has been made" do
        expect(horizontal_winning_board.horizontal_check).to eq("X")
      end
    end
    context ".vertical_check" do
      it "returns the winning value if a vertical connect 4 has been made" do
        expect(vertical_winning_board.vertical_check).to eq("Y")
      end
    end
    context ".win_check" do
      it "returns the winner in horizontal winning conditions is met" do
        expect(horizontal_winning_board.win_check).to eq("X")
      end
      it "returns the winner in vertical winning conditions" do
        expect(vertical_winning_board.win_check).to eq("Y")
      end
      it "returns nil if no winning conditions are met" do
        expect(board.win_check).to eq(nil)
      end
    end
    context ".board_full?" do
      it "returns true when the board is full" do
        expect(full_board.board_full?).to eq(true)
      end
      it "returns false when at least one space on the board is empty" do
        expect(vertical_winning_board.board_full?).to eq(false)
      end
    end

  end
end
