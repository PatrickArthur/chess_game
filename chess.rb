# chess program - in progress

class Board
  def initialize
    @array = Array.new(8) { Array.new(8) }
  end

  def set_pawns
    i = 0
    [1, 6].each do |num|
      while i < @array[num].length
        @array[num][i] = if num == 1
                           'P_White'
                         else
                           'P_Black'
                         end
        i += 1
      end
      i = 0
    end
    set_others
  end

  def set_others
    [0, 7].each do |num|
      if num == 0
        set_array(num, 'white')
      else
        set_array(num, 'black')
      end
    end
    @array
  end

  private

  def set_array(num, color)
    @array[num][0] = "R_#{color}"
    @array[num][7] = "R_#{color}"
    @array[num][1] = "N_#{color}"
    @array[num][6] = "N_#{color}"
    @array[num][2] = "B_#{color}"
    @array[num][5] = "B_#{color}"
    @array[num][4] = "Q_#{color}"
    @array[num][3] = "K_#{color}"
  end
end

class Game
  def move_piece(x_start, y_start, x_end, y_end)
    if @new_game[x_end][y_end].nil?
      @new_game[x_end][y_end] = @new_game[x_start][y_start]
      @new_game[x_start][y_start] = nil
      return @new_game
    else
      puts "#{@new_game[x_end][y_end]} is present"
    end
  end
end

class Player < Game
  def initialize(side)
    @side = side
    @new_game = Board.new.set_pawns
  end
end

pa_test = Player.new('white')
pa_test.move_piece(0, 7, 3, 7)
pa_test.move_piece(0, 0, 3, 0)
pa_test.move_piece(0, 2, 3, 2)
