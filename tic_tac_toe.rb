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
    player_1_sign = gets.chomp
    if validate_input(["x", "O"], player_1_sign)
      continue
    else
      puts "Please input "X" or "O""
      player_1_sign = gets.chomp
    end
  else
  end
end
