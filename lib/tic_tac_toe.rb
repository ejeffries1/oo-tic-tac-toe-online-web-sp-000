require 'pry'

class TicTacToe
  

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    count = 0 
    @board.each{|token| count += 1 if token == "X" || token == "O"}
    count
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
    @board
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

  def turn
    puts "#{current_player} Please make a selection between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index)
      display_board
    elsif
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |i|
      if @board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X" ||
        @board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O"
        return i
      else
        false
        #binding.pry
      end
    end
  end
  
  def full?
   @board.all? do |el|
     if el == " "
       false
     else
       true
     end
   end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play
    until over?
    turn
    end
    
    if won?
      puts("Congratulations #{winner}!")
    elsif draw?
      puts("Cat's Game!")
    end
  end
end
