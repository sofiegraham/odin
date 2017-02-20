require "./mastermind/version.rb"
require 'colorize'
require 'byebug'

module Mastermind
  ROW_LENGTH = 4
  NUM_GUESSES = 3

  class Board
    attr_accessor :grid


    def initialize
      @grid = Array.new(NUM_GUESSES) { GridRow.new }
    end

    class GridRow
      attr_accessor :row, :hints, :guesses, :status
      def initialize
        @guesses = build_row("▢")
        @hints = build_row(".")
        @row = [guesses, hints]
        @status = "empty"
      end
  
      def build_row(sym)
        Array.new(ROW_LENGTH) { sym }
        GridPosition.new(:black)
      end

      class Guess
        COLORS = {
          blue: 'light_blue'
          magenta: 'light_magenta'
          cyan: 'light_cyan'
          yellow: 'light_yellow'
          blank: ''
        }

        def initalize
          set_color(:blank)
        end

        def set_color(color)
          raise unless COLORS[color]
          self.color = color
        end

        def to_s
          COLORS[color]
        end

        private

        attr_accessor :color
      end

      def Hint
        
      end
    end


    def show_grid
      system "clear"
      puts ""
      puts "#{'★'.light_yellow}  #{'MASTERMIND'.light_cyan} #{'★'.light_yellow}"
      puts ""
      grid.each do |grid_row|
        puts grid_row.row.join(" ")
      end
    end
  end

  class Game
    attr_accessor :board, :current_guess
    attr_reader :answer, :game_status

    def initialize
      @board = Board.new
      @answer = random_answer
      @current_guess = 0
      @game_status = :playing
      game_loop
    end

    def random_answer
      answer =[]
      options = ["⬤".light_blue, "⬤".light_magenta, "⬤".light_yellow, "⬤".light_cyan]
      ROW_LENGTH.times { answer << options.sample }
      answer
    end

    def game_loop
      while game_status == :playing
        player_guess
        hints = compare_pegs((board.grid[current_guess].guesses),answer)
        hints.each_with_index do |value, index|
          board.grid[current_guess].hints[index] = value
        end
        check_answer
        @current_guess +=1
      end
      exit
    end

      def player_guess
        ROW_LENGTH.times do |i|
          error = nil
          while board.grid[current_guess].guesses[i] == "▢"
            board.show_grid
            puts " "
            puts error if error
            puts "Pick a color for slot #{i+1}:"
            puts "#{'1: violet'.light_blue} - #{'2: yellow'.light_yellow} - #{'3: blue'.light_cyan} - #{'4: pink'.light_magenta}"
            board.grid[current_guess].guesses[i] = translate_color(gets.chomp.downcase)
            error = ["THAT'S NOT VALID, YOU ASS-BADGER!", "IS THIS TOO HARD FOR YOU, BUTT-FACE?", "JUST PICK A COLOR YOU NIT-WIT!", "THE ANSWER IS EASIER THAN YOUR MOM..."].sample
          end
        end
      end

      def check_answer
        if board.grid[current_guess].guesses == answer
          @game_status = :ended
          board.show_grid
          puts @answer.join(" ")
          puts "A WINNER IS YOU!"
        elsif @current_guess == NUM_GUESSES
          @game_status = :ended
          board.show_grid
          puts @answer.join(" ")
          puts "YOU'RE A BIG FAT LOSER!"
      end
      end

      def translate_color(input)
        case input
        when "violet", "v", "1"
          "⬤".light_blue
        when "yellow", "y", "2"
          "⬤".light_yellow
        when "blue", "b", "3"
          "⬤".light_cyan
        when "pink", "p", "4"
          "⬤".light_magenta
        else
          "▢"
        end
      end

      def compare_pegs(player_guess, answer)
        hint_pegs = []
        player_color_check = []
        answer_color_check = []

        player_guess.each_with_index do |value, index|
          if player_guess[index] == answer[index]
            hint_pegs << "●".light_red
          else
            player_color_check << player_guess[index]
            answer_color_check << answer[index]
          end
        end

        player_color_check.each do |value|
          if answer_color_check.any? {|color| color == value}
            answer_color_check.slice!(answer_color_check.index(value))
            hint_pegs << "●".light_white
          end
        end

        hint_pegs << "." until hint_pegs.length == ROW_LENGTH
        hint_pegs
      end

  end
  game = Game.new

end
