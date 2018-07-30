require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    board.grid.each_with_index do |row, row_idx|
      row_rendering = []
      row.each_with_index do |col, col_idx|
        if (col_idx + row_idx).even?
          row_rendering << "||||".blue
        else
          row_rendering << "[  ]".red
        end
      end
      row_rendering.each do |el|
        print el
      end
      puts
    end
    nil
  end



end
