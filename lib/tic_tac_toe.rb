require 'pry'

class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X"
      true
    elsif @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn(input)
    puts "Please make a selection between 1-9"
    input = gets.strip
    index = input_to_index(input)
    current_player
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      index_1 = combo[0]
      index_2 = combo[1]
      index_3 = combo[2]

      if "X" == index_1 && index_2 && index_3
        "WIN"
        combo
      elsif "O" == index_1 && index_2 && index_3
        "WIN"
        combo
      else
        false
      end
    end
  end

end
