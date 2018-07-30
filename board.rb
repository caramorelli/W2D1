

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate

  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new if self[start_pos].is_a?(NullPiece)
    raise InvalidMoveError.new if valid_pos?(pos) == false

    piece = self[start_pos]
    self[start_pos] = NullPiece.new
    self[end_pos] = piece
  end

  def get_move
    begin
      puts 'Enter position of piece you want to move. E.g. 3,4'
      input = gets.chomp
      input = parse_input(input)
      puts 'Enter position of destination. E.g. 3,4'
      end_input = gets.chomp
      end_input = parse_input(end_input)
      move_piece(input, end_input)
    rescue NoPieceError
      puts 'Sorry, you do not have a piece at this position. Please try again.'
      retry
    rescue InvalidMoveError
      puts 'Sorry, that move is invalid. Please try again.'
      retry
    end
  end

  def parse_input(input)
    input.split(',').map(&:to_i)
  end

  def [](pos)
    row_idx, col_idx = pos
    grid[row_idx][col_idx]
  end

  def []=(pos, value)
    row_idx, col_idx = pos
    grid[row_idx][col_idx] = value
  end

  def valid_pos?(pos)
    row, col = pos
    return false unless row.between?(0, 7) && col.between?(0, 7)
    true
  end
  #
  # def row
  #
  # end
  #
  # def col
  #
  # end
  #
  # def diagonal
  #
  # end

  private

  PIECE_SETUP = [0, 1, 6, 7]

  def populate
    grid.each_with_index do |row, row_idx|
      if PIECE_SETUP.include?(row_idx)
        row.each_index do |idx|
          row[idx] = Piece.new
        end
      else
        row.each_index do |idx|
          row[idx] = NullPiece.new
        end
      end
    end
  end

end

class NoPieceError < StandardError; end
class InvalidMoveError < StandardError; end

class Piece

  def initialize

  end



end

class NullPiece

  def initialize

  end

end
