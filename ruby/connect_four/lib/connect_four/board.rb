module ConnectFour
  class Board
    attr_accessor :grid

    def initialize
      @grid = default_grid
    end

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new} }
    end
=begin
    def hash_grid
      coordinates_array = []
      cells_hash = {}
      6.times do |x|
        7.times do |y|
          coordinates_array << [x,y]
        end
      end
      coordinates_array.each do |coordinates|
        cells_hash[coordinates] = Cell.new
      end
      cells_hash
    end
=end


    def cell_empty?(cell)
      cell.value == :empty ? true : false
    end

    def change_value(coordinates, new_value)
      coordinates_to_cell(coordinates).value = new_value
    end

    def cell_value(coordinates)
      coordinates_to_cell(coordinates).value
    end

    def coordinates_to_cell(coordinates) #[0,2]
      on_board?(coordinates) ? grid[coordinates[0]][coordinates[1]] : BoardError.new("Cell is not on board")
    end

    def on_board?(coordinates) #[0,2]
      grid[coordinates[0]] && grid[coordinates[0]][coordinates[1]] ? true : false
    end



    def win_check
      if horizontal_check
        horizontal_check
      elsif vertical_check
        vertical_check
      #elsif diagonal_check
      #  diagonal_check
      else
        nil
      end
    end
=begin
    def hori_check(coordinates)
      value = coordinates_to_cell(coordinates).value
      counter = 1
      right_coordinates = [coordinates[0],coordinates[1]+1]
      left_coordinates = [coordinates[0],coordinates[1]-1]
      queue = [right_coordinates,left_coordinates]
      until counter >= 4 || (coordinates)


    def hori_check(coordinates) #[2,3]
      value ||= coordinates_to_cell(coordinates).value
      @visited ||= [coordinates]
      queue = []
      right_coordinates = [coordinates[0],coordinates[1]+1]#[2,4]
      left_coordinates = [coordinates[0],coordinates[1]-1]#[2,2]
      if @visited.length >= 4
        return true
      elsif !visited.include?(right_coordinates) && on_board?(right_coordinates) && (coordinates_to_cell(right_coordinates).value == value)
        @visited << [right_coordinates]
        hori_check(right_coordinates)
      elsif !visited.include?(left_coordinates) && on_board?(left_coordinates) && (coordinates_to_cell(left_coordinates).value == value)
        @visited << [left_coordinates]
        hori_check(left_coordinates)
      else
        return false
      end


  end
end
=end
    def horizontal_check(grid=@grid)
      counter = 0
      result = nil
      grid.each do |row|
        row.each_with_index do |cell, index|
          if cell_empty?(cell)
            next
          else
            value = cell.value

            until counter >= 4 || !row[index]
              if row[index].value == value
                counter += 1
                index += 1
              else
                break
              end
            end

            if counter >= 4
              result = value
              return result
            end

          end

        end
      end
      result
    end

    def vertical_check
      temporary_grid = grid.transpose
      horizontal_check(temporary_grid)
    end

    def diagonal_check
      counter = 0
      result = nil
      x = 0
      y = 0
      until counter >= 4 || !on_board([x,y])
        cell = coordinates_to_cell([x,y])
        if cell_empty?(cell)
          counter = 0
          value = nil
        elsif value #check if the value is the same or exists
          value ||= cell.value
          counter += 1
        end
        x += 1
        y += 1

      end




      grid.each do |row|
        row.each. do |cell|


    end

    def board_full?
      grid.each do |row|
        row.each do |cell|
          return false if cell.value == :empty
        end
      end
      true
    end

  end



=begin

    def horizontal_check(cell) #[2,3]
      value ||= cell.value
      visited ||= [cell]
      count ||= 0
      right_cell = cell([coordinates[0],coordinates[1]+1])
      left_cell = coordinates_to_cell([coordinates[0],coordinates[1]-1])
      if right_cell.value == value
        count += 1
        visited << [coordinates]
        horizontal_check([coordinates[0],coordinates[1]+1])

    end
=end





  class BoardError < StandardError

    def initialize(msg="Board error occurred")
      super
    end

  end




end
