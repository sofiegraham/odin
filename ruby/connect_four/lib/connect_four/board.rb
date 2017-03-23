module ConnectFour
  class Board
    attr_accessor :grid

    def initialize
      @grid = default_grid
    end

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new} }
    end

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


    def valid_move?(coordinates)
      if floating?(coordinates)
        false
      else
        cell = coordinates_to_cell(coordinates)
        if cell_empty?(cell)
          true
        else
          false
        end
      end
    end

    def floating?(coordinates)
      if coordinates[0] == grid.length-1
        false
      else
        cell_to_check = coordinates_to_cell([coordinates[0]+1,coordinates[1]])
        cell_to_check.value == :empty ? true : false
      end
    end


    def win_check
      if horizontal_check
        horizontal_check
      elsif vertical_check
        vertical_check
      elsif diagonal_check
        diagonal_check
      else
        nil
      end
    end

    def horizontal_check(grid=@grid)
      result = nil
      grid.each do |row|
        row.each_with_index do |cell, index|
          counter = 0
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
      grid.length.times do |number|
        x = number
        y = 0
        until counter >= 4 || !on_board?([x,y])
          cell = coordinates_to_cell([x,y])
          if cell_empty?(cell)
            counter = 0
            value = nil
          elsif !value
            value = cell.value
            counter += 1
          elsif value == cell.value
            counter += 1
          else
            value = cell.value
            counter = 1
          end
          x += 1
          y += 1
        end
        if counter >= 4
          result = value
          return result
        end
      end
      grid[0].length.times do |number|
        x = 0
        y = number
        until counter >= 4 || !on_board?([x,y])
          cell = coordinates_to_cell([x,y])
          if cell_empty?(cell)
            counter = 0
            value = nil
          elsif !value
            value = cell.value
            counter += 1
          elsif value == cell.value
            counter += 1
          else
            value = cell.value
            counter = 1
          end
          x += 1
          y += 1
        end
        if counter >= 4
          result = value
          return result
        end
      end
      result
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

  class BoardError < StandardError
    def initialize(msg="Board error occurred")
      super
    end
  end

end
