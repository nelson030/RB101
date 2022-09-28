SUITS = [[" ♠ ", "-SPADE-"], [" ♡ ", "-HEART-"], [" ♢ ", "DIAMOND"],
         [" ♣ ", " -CLUB-"]]
VALUES = [" 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10",
          " J ", " Q ", " K ", " A "]

# Creates an array to be displayed of card
def make_card_arr(suit, value)
  card = [" ----------- ",
          "| #{value}       |",
          "| #{suit[0]}       |",
          "|           |",
          "|  #{suit[1]}  |",
          "|           |",
          "|       #{suit[0]} |",
          "|       #{value} |",
          " ----------- "]
  card
end

# Adds card to the appended cards array to display to user
def append_card_arrays(all_cards_arr)
  num_lines_of_card = all_cards_arr[0].length
  num_of_cards = all_cards_arr.length
  counter = 0
  iteration = 0
  appended_cards_arr = []
  loop do
    appended_cards_arr = append_cards(num_lines_of_card, iteration, counter,
                                      appended_cards_arr, all_cards_arr)
    counter = 0
    iteration += 1
    break if iteration == (num_of_cards - 1)
  end
  appended_cards_arr
end

def append_cards(num_lines, iteration, counter, append_card_arr, cards_arr)
  loop do
    if iteration == 0
      append_card_arr << cards_arr[iteration][counter] + " " +
                         cards_arr[iteration + 1][counter]
    else
      append_card_arr[counter] << " " +
                                  cards_arr[iteration + 1][counter]
    end
    counter += 1
    break if counter == num_lines
  end
  append_card_arr
end

# Calculates value of given cards
def get_total_value(value_arr)
  total_non_aces = value_non_aces(value_arr)
  total = value_only_aces(value_arr, total_non_aces)
  total
end

def value_non_aces(value_arr)
  total_value = 0
  value_arr.each do |str|
    if str == " J " || str == " Q " || str == " K "
      num = 10
      total_value += num
    elsif str == " A "
    else
      num = str.to_i
      total_value += num
    end
  end
  total_value
end

def value_only_aces(value_arr, total)
  value_arr.each do |str|
    if str == " A "
      num = if ace_high?(total)
              11
            else
              1
            end
      total += num
    end
  end
  total
end

# Assigns suit and value for a card that has not been taken yet
def create_valid_card(taken_cards_arr)
  valid_card = []
  loop do
    valid_card = [SUITS[rand(0..3)], VALUES[rand(0..12)]]
    if taken_cards_arr.include?(valid_card)
    else
      break
    end
  end
  valid_card
end

# Return if ace should be 11 (if true) or 1 (if false)
def ace_high?(total)
  total < 11
end

def wait_until_user_ready
  puts "Enter anything to continue."
  gets.chomp
end

def cool_21_display(str)
  time_counter = 0.05
  21.times do
    puts str
    sleep(time_counter)
  end
  puts `clear`
end

def number_wins_to_play_to
  first_to = 1
  loop do
    puts "How many win(s) would you like to play to? (Max is 21)"
    first_to = gets.chomp.to_i
    if first_to >= 1 && first_to <= 21
      puts "Great! First to #{first_to} win(s) is the winner!"
      break
    else
      puts "Invalid. Please select an integer 1-21."
    end
  end
  first_to
end

# ------------------------------------------------------------------------------

puts `clear`
puts "Welcome to Twenty-One!"
first_to = number_wins_to_play_to
wait_until_user_ready
player_win_total = 0
dealer_win_total = 0
loop do
  puts `clear`
  # Initialize empty card arrays
  taken_cards = []
  player_values = []
  dealer_values = []
  # Create player's cards
  player_card_one = create_valid_card(taken_cards)
  taken_cards << player_card_one
  player_card_one_arr = make_card_arr(player_card_one[0], player_card_one[1])
  player_card_two = create_valid_card(taken_cards)
  taken_cards << player_card_two
  player_card_two_arr = make_card_arr(player_card_two[0], player_card_two[1])
  # Add player cards to player_values array
  player_values << player_card_one[1]
  player_values << player_card_two[1]
  # Create dealer cards
  dealer_card_one = create_valid_card(taken_cards)
  taken_cards << dealer_card_one
  dealer_card_one_arr = make_card_arr(dealer_card_one[0], dealer_card_one[1])
  # Create hidden card to display
  dealer_card_two_hidden = [[" - ", "-------"], " - "]
  dealer_card_two_hidden_arr = make_card_arr(dealer_card_two_hidden[0],
                                             dealer_card_two_hidden[1])
  dealer_card_two = create_valid_card(taken_cards)
  taken_cards << dealer_card_two
  dealer_card_two_arr = make_card_arr(dealer_card_two[0], dealer_card_two[1])
  # Add dealer cards to dealer_values array
  dealer_values << dealer_card_one[1]
  dealer_values << dealer_card_two[1]
  player_cards = append_card_arrays([player_card_one_arr, player_card_two_arr])
  dealer_cards_1_hidden = append_card_arrays([dealer_card_one_arr,
                                              dealer_card_two_hidden_arr])
  # Show Player and dealer's cards
  dealer_cards = append_card_arrays([dealer_card_one_arr, dealer_card_two_arr])
  puts "The dealer's cards are: "
  puts dealer_cards_1_hidden
  puts "Your first two cards are: "
  puts player_cards
  current_player_total = get_total_value(player_values)
  current_dealer_total = get_total_value(dealer_values)
  puts "Player current total value is #{current_player_total}"
  player_append_card_counter = 2
  player_cards_row2 = []
  # Player's Turn
  loop do
    hit_or_stay = ""
    loop do
      puts "Would you like to hit or stay? ('h' for hit or 's' for stay.)"
      hit_or_stay = gets.chomp
      if hit_or_stay.downcase.start_with?('h') ||
         hit_or_stay.downcase.start_with?('s')
        break
      else
        puts "Invalid selection. Try again."
      end
    end
    if hit_or_stay.downcase.start_with?('h')
      player_append_card_counter += 1
      new_player_card = create_valid_card(taken_cards)
      taken_cards << new_player_card
      new_player_card_arr = make_card_arr(new_player_card[0],
                                          new_player_card[1])
      player_values << new_player_card[1]
      puts "You drew a..."
      puts new_player_card_arr
      wait_until_user_ready
      if player_append_card_counter < 5
        player_cards = append_card_arrays([player_cards, new_player_card_arr])
      elsif player_append_card_counter == 5
        player_cards_row2 = new_player_card_arr
      else
        player_cards_row2 = append_card_arrays([player_cards_row2,
                                                new_player_card_arr])
      end
    else
      break
    end
    current_player_total = get_total_value(player_values)
    puts `clear`
    if current_player_total > 21
      puts "You busted!"
      break
    elsif current_player_total == 21
      puts "You hit 21!!"
      cool_21_display("21")
      puts "You hit 21!!"
      wait_until_user_ready
    end
    puts "These are the Dealer's known cards: "
    puts dealer_cards_1_hidden
    puts "These are your current cards: "
    puts player_cards
    puts player_cards_row2
    puts "This is your total value: "
    puts current_player_total
  end
  player_bust = true if current_player_total > 21
  dealer_append_card_counter = 2
  dealer_cards_row2 = []
  # Dealer's Turn
  loop do
    break if player_bust
    puts `clear`
    puts "Dealer's Turn"
    if current_dealer_total < 17 ||
       current_dealer_total < current_player_total
      dealer_append_card_counter += 1
      new_dealer_card = create_valid_card(taken_cards)
      taken_cards << new_dealer_card
      new_dealer_card_arr = make_card_arr(new_dealer_card[0],
                                          new_dealer_card[1])
      dealer_values << new_dealer_card[1]
      puts "The dealer drew a..."
      puts new_dealer_card_arr
      wait_until_user_ready
      if dealer_append_card_counter < 5
        dealer_cards = append_card_arrays([dealer_cards, new_dealer_card_arr])
      elsif dealer_append_card_counter == 5
        dealer_cards_row2 = new_dealer_card_arr
      else
        dealer_cards_row2 = append_card_arrays([dealer_cards_row2,
                                                new_dealer_card_arr])
      end
    else
      puts "These are the dealer's cards: "
      puts dealer_cards
      puts "This is the dealer's total value: "
      puts current_dealer_total
      break
    end
    current_dealer_total = get_total_value(dealer_values)
    puts "These are the dealer's current cards: "
    puts dealer_cards
    puts dealer_cards_row2
    puts "This is the dealer's total value: "
    puts current_dealer_total
    wait_until_user_ready
    puts `clear`
    if current_dealer_total > 21
      puts "The dealer busted!"
      wait_until_user_ready
      break
    elsif current_dealer_total == 21
      puts "The dealer hit 21!!"
      cool_21_display("21")
      puts "The dealer hit 21!!"
      wait_until_user_ready
    end
  end
  dealer_bust = true if current_dealer_total > 21
  if player_bust
    puts "Dealer Wins!"
    dealer_win_total += 1
  elsif dealer_bust
    puts "You Win!"
    player_win_total += 1
  elsif current_player_total > current_dealer_total
    puts "You Win!"
    wait_until_user_ready
    puts `clear`
    puts "Final Score: "
    puts "You: #{current_player_total}"
    puts "Dealer: #{current_dealer_total}"
    player_win_total += 1
  elsif current_player_total < current_dealer_total
    wait_until_user_ready
    puts `clear`
    puts "Final Score: "
    puts "You: #{current_player_total}"
    puts "Dealer: #{current_dealer_total}"
    dealer_win_total += 1
  else
    puts "It's a tie!"
    wait_until_user_ready
    puts `clear`
    puts "Final Score: "
    puts "You: #{current_player_total}"
    puts "Dealer: #{current_dealer_total}"
  end
  wait_until_user_ready
  puts `clear`
  puts "Your Win Total: #{player_win_total}"
  puts "Dealer Win Total: #{dealer_win_total}"
  wait_until_user_ready
  if player_win_total == first_to
    puts `clear`
    puts "Player has won #{first_to} game(s)!"
    wait_until_user_ready
    puts "GAME OVER"
    break
  elsif dealer_win_total == first_to
    puts `clear`
    puts "Dealer has won #{first_to} game(s)!"
    wait_until_user_ready
    puts `clear`
    puts "GAME OVER"
    break
  end
end
wait_until_user_ready
puts `clear`
puts "Final Win Total: "
puts "You: #{player_win_total}"
puts "Dealer: #{dealer_win_total}"
wait_until_user_ready
puts "Thanks for playing!"
