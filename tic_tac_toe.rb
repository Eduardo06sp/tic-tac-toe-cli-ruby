class GenerateNewGame
  def initialize(p1, p2, p1_sign)
    @@player_1_score = 0
    @@player_2_score = 0

    attr_reader :space_1,
      :space_2,
      :space_3,
      :space_4,
      :space_5,
      :space_6,
      :space_7,
      :space_8,
      :space_9,
      :available_spaces,
      :game_board,
      :p1_name,
      :p2_name,
      :p1_sign,
      :p2_sign

    @space_1 = "1"
    @space_2 = "2"
    @space_3 = "3"
    @space_4 = "4"
    @space_5 = "5"
    @space_6 = "6"
    @space_7 = "7"
    @space_8 = "8"
    @space_9 = "9"

    @spaces = [
      space_1,
      space_2,
      space_3,
      space_4,
      space_5,
      space_6,
      space_7,
      space_8,
      space_9,
    ]

    @available_spaces = [
      space_1,
      space_2,
      space_3,
      space_4,
      space_5,
      space_6,
      space_7,
      space_8,
      space_9,
    ]

    @game_board =
      "#{@space_1} | #{@space_2} | #{@space_3} \n
      #{@space_4} | #{@space_5} | #{@space_6} \n
      #{@space_7} | #{@space_8} | #{@space_9}"

    @player1_name = p1
    @player2_name = p2
    @player1_sign = p1_sign
    @player2_sign = p2_sign
  end
end

def validate_input(values, input)
  values.any? do |value|
    value == input ? return true : return false
  end
end

def start_new_game
  puts "Would you like to play Tic-Tac-Toe?"
  puts "Please enter y (yes) or n (no)."

  answer = gets.chomp

  if answer == "y"
    puts "What would you like Player 1 to be named?"
    player_1_name = gets.chomp

    puts "What would you like Player 2 to be named?"
    player_2_name = gets.chomp

    puts "#{player_1_name}, please choose a sign: "X" or "O""
    player_1_sign = gets.chomp.upcase
    if validate_input(["x", "O"], player_1_sign)
      continue
    else
      puts "Please input "X" or "O""
      player_1_sign = gets.chomp.upcase
    end
  else
    puts "Have a beautiful day. :}"
    return
  end
end

def play
  while !(game_over)
    turn = p1

    if validate_input(available_spaces, move)
      check_turn(turn)
    else
      puts "That space is unavailable.
      \nPlease type in one of the following available spaces: 
      #{available_spaces}"

      check_turn(turn)
    end
  end
end

def turn(name, sign)
  puts "#{name} (#{sign}) it's your turn."
  puts "Please select an open spot."
  move = gets.chomp


  spaces[move - 1]=(sign)
  available_spaces.delete(spaces[move - 1])

  puts game_board
end

def check_turn(player_turn)
  if turn == p1
    turn(player_1_name, player_1_sign)
    turn = p2
  else
    turn(player_2_name, player_2_sign)
    turn = p1
  end
end

def game_over
  win_possibilities = {
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [7, 4, 1],
    [8, 5, 2],
    [9, 6, 3],
    [3, 5, 7],
    [1, 5, 9]
  }

  if available_spaces.length = 0
    end_game(nil)
  end

  win_possibilities.each do |win_array|
    if (win_array.all? do |space|
      spaces[space - 1] == "X"
    end)
      end_game("X")
    end
    ||
    if (win_array.all? do |space|
      spaces[space - 1] == "O"
    end)
      end_game("O")
    end
  end
end
