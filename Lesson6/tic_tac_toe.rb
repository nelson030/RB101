# create an empty board
def empty_board
  arr_complete = [" | | ", "-----",
                  " | | ", "-----",
                  " | | "]
  arr_complete
end

# display a board for user to type which number slot to choose
def choice_board(chosen_values)
  board = empty_board
  current_number = 1
  row = 0
  col = 0
  loop do
    if col > 4 # change to next line
      col = 0
      row += 2
    end
    break if row > 4 # ends loop after third row
    string_number = current_number.to_s
    board[row][col] = if chosen_values.include?(string_number + "x")
                        "X"
                      elsif chosen_values.include?(string_number + "o")
                        "O"
                      else
                        string_number
                      end

    col += 2
    current_number += 1
  end
  board
end

# show board with no choice numbers
def show_current_board_no_numbers(chosen_values)
  board = empty_board
  current_number = 1
  row = 0
  col = 0
  loop do
    if col > 4 # change to next line
      col = 0
      row += 2
    end
    break if row > 4 # ends loop after third row
    string_number = current_number.to_s
    board[row][col] = if chosen_values.include?(string_number + "x")
                        "X"
                      elsif chosen_values.include?(string_number + "o")
                        "O"
                      else
                        " "
                      end

    col += 2
    current_number += 1
  end
  puts board
end

# give array of available spots for computer_choice method
def computer_available_spots(taken_spots_nums)
  possible_spots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  available_spots = possible_spots.difference(taken_spots_nums)
  available_spots
end

# choose random available spot for computer
def computer_choice(taken_choices)
  possible_choices = computer_available_spots(taken_choices)
  random_num = rand(0...possible_choices.length)
  choice = possible_choices[random_num]
  choice
end

# determine if user selection is valid
def valid_choice?(chosen_values, num_choice)
  num_array_valid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  !chosen_values.include?(num_choice) && num_array_valid.include?(num_choice)
end

# determine if user has a winning combo
def user_a_winner?(choice_arr, user_x_or_o)
  user_choices = []
  choice_arr.each do |choice|
    if choice.end_with?(user_x_or_o)
      num = choice[0].to_i
      user_choices << num
    end
  end
  a_winning_combo?(user_choices) # returns true if a winner
end

# determine if comp has a winning combo
def comp_a_winner?(choice_arr, comp_x_or_o)
  comp_choices = []
  choice_arr.each do |choice|
    if choice.end_with?(comp_x_or_o)
      num = choice[0].to_i
      comp_choices << num
    end
  end
  a_winning_combo?(comp_choices) # returns true if comp is a winner
end

# determine if user or comp choices are included in the winning combo array
def a_winning_combo?(user_or_comp_num_arr)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]]
  winning_combos.each do |win_arr|
    counter = 0
    win_arr.each do |num|
      break if !user_or_comp_num_arr.include?(num)
      counter += 1
      if counter == 3
        return true
      end
    end
  end
  false
end

def get_arr(arr_w_x_o, x_or_o)
  num_arr = []
  if x_or_o == 'x' # if user chose x
    arr_w_x_o.each do |str|
      num_arr << str[0].to_i if str[1] == 'x'
    end
  else # if user chose o
    arr_w_x_o.each do |str|
      num_arr << str[0].to_i if str[1] == 'o'
    end
  end
  num_arr
end

def find_defense_opportunity(arr_w_x_o, all_num_arr, user_x_or_o)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]]
  user_arr = get_arr(arr_w_x_o, user_x_or_o)
  comp_arr = all_num_arr.select { |num| !user_arr.include?(num) }
  choose_arr = []
  winning_combos.each do |combo|
    counter = 0
    combo.each do |num|
      counter += 1 if user_arr.include?(num) # counter up 1 if user choice
      counter -= 1 if comp_arr.include?(num) # counter down 1 if comp choice
    end
    choose_arr = combo if counter >= 2 # assign defense opportunity array
  end
  choose_num = choose_arr.select do |num| # select defense opportunity num
    !user_arr.include?(num)
  end
  choose_num[0] # return defense opportunity
end

def find_attack_opportunity(arr_w_x_o, all_num_arr, comp_x_or_o)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]]
  comp_arr = get_arr(arr_w_x_o, comp_x_or_o)
  user_arr = all_num_arr.select { |num| !comp_arr.include?(num) }
  choose_arr = []
  winning_combos.each do |combo|
    counter = 0
    combo.each do |num|
      counter += 1 if comp_arr.include?(num) # counter up 1 if user choice
      counter -= 1 if user_arr.include?(num) # counter down 1 if comp choice
    end
    choose_arr = combo if counter >= 2 # assign defense opportunity array
  end
  choose_num = choose_arr.select do |num| # select defense opportunity num
    !comp_arr.include?(num)
  end
  if choose_num[0]
    choose_num[0]
  elsif !all_num_arr.include?(5)
    5
  else
    choose_num[0]
  end
end

# -----------------------------------------------------------------------------

puts `clear`
puts "Welcome to Tic-Tac-Toe!"
user_wins_counter = 0
comp_wins_counter = 0
loop do
  comp_first = false # initialize boolean. It will turn to true if comp goes 1st
  choice_counter = 0 # initialize counter.
  # Even will be players turn. Odd will be computers.
  loop do
    puts "Would you like to go first? (Type 'y' for yes or 'n' for no.)"
    turn_choice = gets.chomp
    if turn_choice.downcase.start_with?('y')
      puts "You choose first!"
      choice_counter = 0
      break
    elsif turn_choice.downcase.start_with?('n')
      puts "The Computer will choose first!"
      choice_counter = 1
      comp_first = true
      break
    else
      puts "Invalid. Please type only 'y' for yes or 'n' for no."
    end
  end
  x_or_o_user = "" # intialize user choice 'icon'
  x_or_o_comp = "" # intialize comp choice 'icon'
  loop do
    puts "Would you like to be X's or O's? (Type the letter 'x' or 'o')"
    x_or_o_start = gets.chomp
    if x_or_o_start.downcase.start_with?('x')
      x_or_o_user = "x"
      x_or_o_comp = "o"
      break
    elsif x_or_o_start.downcase.start_with?('o') ||
          x_or_o_start.downcase.start_with?('0')
      x_or_o_user = "o"
      x_or_o_comp = "x"
      break
    else
      puts "Invalid. Please type only the letter 'x' or 'o'."
    end
  end
  choices_with_x_or_o = [] # array that passes all choices with x and o values
  # (ie [1x, ,9o, 5o, 6x])
  choices_only_num = [] # array that passes all choices with only numbers
  # (ie [1, 9, 5, 6]
  puts `clear`
  # game loop. user and comp choosing/displaying spots and deciding winner
  loop do
    comp_defense_choice = nil # initialize comp defense var
    comp_attack_choice = nil # initialize comp attack var
    # determine if there's a winner
    if comp_a_winner?(choices_with_x_or_o, x_or_o_comp)
      puts "Computer Wins!!"
      comp_wins_counter += 1
      sleep(1)
      puts "Here's the final board."
      show_current_board_no_numbers(choices_with_x_or_o)
      break
    elsif user_a_winner?(choices_with_x_or_o, x_or_o_user)
      puts "User Wins!!"
      user_wins_counter += 1
      sleep(1)
      puts "Here's the final board."
      show_current_board_no_numbers(choices_with_x_or_o)
      break
    end
    # determine if the condition is a draw
    if (choice_counter > 8 && comp_first == false) ||
       (choice_counter > 9 && comp_first == true)
      puts "It's a draw!!"
      sleep(1)
      puts "Here's the final board."
      show_current_board_no_numbers(choices_with_x_or_o)
      break
    end
    # user's turn
    if choice_counter.even?
      loop do
        # display available choices
        numbered_board = choice_board(choices_with_x_or_o)
        numbered_board.each do |line|
          puts line
        end
        puts "Your Turn!"
        puts "Please type the number of which slot you want to choose."
        user_num = gets.chomp.to_i
        # add user value and update board if it is a valid choice
        if valid_choice?(choices_only_num, user_num)
          choices_with_x_or_o << user_num.to_s + x_or_o_user
          choices_only_num << user_num
          choice_counter += 1
          puts "You chose slot #{user_num}"
          sleep(0.5)
          puts "Here's the updated Board"
          show_current_board_no_numbers(choices_with_x_or_o)
          sleep(1.25)
          puts `clear`
          break
        else
          puts "Invalid selection. Try again"
        end
      end
    # comp's turn
    elsif choice_counter.odd?
      puts "Computer Choosing Spot..."
      sleep(1)
      comp_defense_choice = find_defense_opportunity(choices_with_x_or_o,
                                                     choices_only_num,
                                                     x_or_o_user)
      comp_attack_choice = find_attack_opportunity(choices_with_x_or_o,
                                                   choices_only_num,
                                                   x_or_o_comp)
      comp_num = if comp_attack_choice # if there is a attack option
                   comp_attack_choice # choose the 1st available attack play
                 elsif comp_defense_choice # if there is a defense option
                   comp_defense_choice # choose the 1st available defense play
                 else # else there is no attack or defense option
                   computer_choice(choices_only_num) # choose random
                 end
      choices_with_x_or_o << comp_num.to_s + x_or_o_comp
      choices_only_num << comp_num
      choice_counter += 1
      puts "The computer chooses spot #{comp_num}"
      sleep(0.5)
      puts "Here's the updated Board"
      show_current_board_no_numbers(choices_with_x_or_o)
      sleep(1.25)
      puts `clear`
    else
      puts "System error."
    end
  end
  # determine if user wants to play again
  play_again = ""
  loop do
    puts `clear`
    puts "Game Over!"
    puts "User Wins: #{user_wins_counter}"
    puts "Computer Wins: #{comp_wins_counter}"
    sleep(1.5)
    puts "Play again? ('y' for yes or 'n' for no.)"
    play_again = gets.chomp
    if play_again.downcase.start_with?('y')
      break
    elsif play_again.downcase.start_with?('n')
      break
    else
      puts "Invalid. Try again with only 'y' or 'n'."
    end
  end
  break if play_again.downcase.start_with?('n')
end

puts `clear`
puts "Final Score"
puts "User Wins: #{user_wins_counter}"
puts "Computer Wins: #{comp_wins_counter}"
sleep(1)
puts "Thanks for playing!"
sleep(2)
