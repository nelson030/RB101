VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_CHOICES_SHORT = ['r', 'p', 'sc', 'l', 'sp']
VALID_GAMES_NUMBER = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]

def prompt(message)
  puts "=> #{message}"
end

def won?(first, second)
  first == 'rock' && second == 'scissors' ||
    first == 'rock' && second == 'lizard' ||
    first == 'paper' && second == 'rock' ||
    first == 'paper' && second == 'spock' ||
    first == 'scissors' && second == 'paper' ||
    first == 'scissors' && second == 'lizard' ||
    first == 'spock' && second == 'rock' ||
    first == 'spock' && second == 'scissors' ||
    first == 'lizard' && second == 'spock' ||
    first == 'lizard' && second == 'paper'
end

def display_results(player, computer)
  if won?(player, computer)
    prompt('You won!')
  elsif won?(computer, player)
    prompt("The computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  prompt("Welcome to rock, paper, scissors, lizard, spock!")
  max_games = ''
  loop do
    prompt("How many games do you want to play best of?
      (Please only input an odd number, with a maximum of 21)")
    max_games = gets.chomp.to_i
    if VALID_GAMES_NUMBER.include?(max_games)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  win_number = (max_games.to_f / 2).ceil(0).to_i
  win_count_player = 0
  win_count_computer = 0
  loop do
    choice = ''
    loop do
      prompt("Make your choice: ")
      i = 0
      while i < VALID_CHOICES_SHORT.length
        prompt("Type '#{VALID_CHOICES_SHORT[i]}' for #{VALID_CHOICES[i]}")
        i += 1
      end
      choice = gets.chomp
      if VALID_CHOICES_SHORT.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
    choice = VALID_CHOICES[VALID_CHOICES_SHORT.index(choice)]
    computer_choice = VALID_CHOICES.sample
    puts "You chose #{choice}. Computer chose #{computer_choice}."
    display_results(choice, computer_choice)
    if won?(choice, computer_choice)
      win_count_player += 1
    elsif won?(computer_choice, choice)
      win_count_computer += 1
    end
    break if win_count_computer == win_number || win_count_player == win_number
    prompt("The score is #{win_count_player} games you.
      #{win_count_computer} games computer.")
  end
  if win_count_player > win_count_computer
    prompt("You won #{win_count_player} games to #{win_count_computer}!")
  else
    prompt("You lost #{win_count_player} games to #{win_count_computer}.")
  end
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thanks for playing!")
