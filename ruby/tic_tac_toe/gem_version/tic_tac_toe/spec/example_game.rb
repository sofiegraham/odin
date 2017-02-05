require_relative "../lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
sofie = TicTacToe::Player.new({color: "X", name: "sofie"})
connor = TicTacToe::Player.new({color: "O", name: "connor"})
players = [sofie, connor]
TicTacToe::Game.new(players).play
