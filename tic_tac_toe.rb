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
      :space_9

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
