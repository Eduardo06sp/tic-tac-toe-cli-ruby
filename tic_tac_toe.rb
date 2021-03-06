class GenerateNewGame
  @@player_1_score = 0
  @@player_2_score = 0

    attr_accessor :player_turn
    attr_reader :spaces,
      :available_spaces,
      :player_1_name,
      :player_2_name,
      :player_1_sign,
      :player_2_sign

  def initialize(p1, p2, p1_sign, p2_sign)

    @spaces = (1..9).to_a

    @available_spaces = spaces.dup

    @player_turn = "p1"
    @player_1_name = p1
    @player_2_name = p2
    @player_1_sign = p1_sign
    @player_2_sign = p2_sign
  end

  def self.validate_input(values, input)
    values.any? do |value|
      value == input
    end
  end

  def display_game_board
    puts "#{spaces[0]} | #{spaces[1]} | #{spaces[2]}
      \n#{spaces[3]} | #{spaces[4]} | #{spaces[5]}
      \n#{spaces[6]} | #{spaces[7]} | #{spaces[8]}"
  end

  def play
    while !(game_over)
      check_turn(player_turn)
    end
  end

  def turn(name, sign)
    display_game_board

    puts "#{name} (#{sign}) it's your turn."
    puts "Please select an open spot."
    move = gets.chomp.to_i

    if GenerateNewGame.validate_input(available_spaces, move)
      available_spaces.delete(spaces[move - 1])
      spaces[move - 1]=(sign)

    else
      puts "That space is unavailable.
      \nPlease type in one of the following available spaces: 
      #{available_spaces}"

      turn(name, sign)
    end

  end

  def check_turn(player_turn)
    if player_turn == "p1"
      turn(player_1_name, player_1_sign)
      self.player_turn = "p2"
    else
      turn(player_2_name, player_2_sign)
      self.player_turn = "p1"
    end
  end

  def end_game(outcome)
    display_game_board
    puts "Game over!"

    if outcome == player_1_sign
      puts "#{player_1_name} won the match!"
      @@player_1_score += 1

    elsif outcome == player_2_sign
      puts "#{player_2_name} won the match!"
      @@player_2_score += 1

    else
      puts "Game ends in a tie."
    end

    puts "#{player_1_name}'s score: #{@@player_1_score}"
    puts "#{player_2_name}'s score: #{@@player_2_score}"

    puts "Would you like to rematch?"
    answer = gets.chomp

    while !(GenerateNewGame.validate_input(["y", "n"], answer))
      puts "Please type in \"y\" (yes) or \"n\" (no)."
      answer = gets.chomp
    end

    if answer == "y"
      game = GenerateNewGame.new(player_1_name, player_2_name, player_1_sign, player_2_sign)
      game.play
    else
      puts "Restart game?"

      answer = gets.chomp
      while !(GenerateNewGame.validate_input(["y", "n"], answer))
        puts "Please type in \"y\" (yes) or \"n\" (no)."
        answer = gets.chomp
      end

      if answer == "y"
        @@player_1_score = 0
        @@player_2_score = 0
        start_new_game
      else
        puts "Have a beautiful day. :}"
        return
      end
    end
  end

  def game_over
    win_possibilities = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [7, 4, 1],
      [8, 5, 2],
      [9, 6, 3],
      [3, 5, 7],
      [1, 5, 9]
    ]

    win_possibilities.each do |win_array|
      if (win_array.all? do |space|
        spaces[space - 1] == "X"
      end)
        end_game("X")
        return true
      end
    end

    win_possibilities.each do |win_array|
      if (win_array.all? do |space|
        spaces[space - 1] == "O"
      end)
        end_game("O")
        return true
      end
    end

    if available_spaces.length == 0
      end_game(nil)
      return true
    end
  end
end

def start_new_game
  puts "Would you like to play Tic-Tac-Toe?"
  puts "Please enter y (yes) or n (no)."

  answer = gets.chomp

  while !(GenerateNewGame.validate_input(["y", "n"], answer))
    puts "Please type in \"y\" (yes) or \"n\" (no)."
    answer = gets.chomp
  end

  if answer == "y"
    puts "What would you like Player 1 to be named?"
    player_1_name = gets.chomp

    puts "What would you like Player 2 to be named?"
    player_2_name = gets.chomp

    puts "#{player_1_name}, please choose a sign: \"X\" or \"O\""
    player_1_sign = gets.chomp.upcase

    while !(GenerateNewGame.validate_input(["X", "O"], player_1_sign))
      puts 'Please input "X" or "O"'
      player_1_sign = gets.chomp.upcase
    end
    player_1_sign == "X" ? player_2_sign = "O" : player_2_sign = "X"
    game = GenerateNewGame.new(player_1_name, player_2_name, player_1_sign, player_2_sign)
    game.play

  else
    puts "Have a beautiful day. :}"
    return
  end
end

start_new_game
