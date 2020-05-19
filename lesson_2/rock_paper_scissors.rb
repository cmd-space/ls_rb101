# frozen_string_literal: true

VALID_CHOICES = %w[rock r paper p scissors sc lizard l spock sp].freeze
FIGHT_LEGEND = {
  rock: %w[scissors lizard],
  paper: %w[rock spock],
  scissors: %w[paper lizard],
  lizard: %w[spock paper],
  spock: %w[scissors rock]
}.freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  FIGHT_LEGEND[first.to_sym].include?(second)
end

def update_score(message, score)
  if message == 'You won!'
    score[:player] += 1
  elsif message == 'The computer won!'
    score[:computer] += 1
  else
    score
  end
  score
end

def result(player, computer)
  if win?(player, computer)
    'You won!'
  elsif win?(computer, player)
    'The computer won!'
  else
    'It\'s a tie!'
  end
end

def convert_choice!(choice)
  case choice
  when 'r' then choice = 'rock'
  when 'p' then choice = 'paper'
  when 'sc' then choice = 'scissors'
  when 'l' then choice = 'lizard'
  when 'sp' then choice = 'spock'
  else choice
  end
  choice
end

def grand_champion?(score)
  score[:player] > score[:computer] ? 'PLAYER' : 'COMPUTER'
end

loop do
  scoreboard = { player: 0, computer: 0 }
  prompt('Choose from the following')
  prompt('The option to the right of each choice can be used for ease')
  loop do
    choice = ''
    loop do
      prompt("#{VALID_CHOICES.join(', ')}?")
      choice = convert_choice!(gets.chomp)

      break if VALID_CHOICES.include?(choice)

      prompt('That is not a valid choice. Please try again.')
    end

    computer_choice = convert_choice!(VALID_CHOICES.sample)

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_result = result(choice, computer_choice)
    prompt(display_result)

    scoreboard = update_score(display_result, scoreboard)

    break if scoreboard[:player] == 5 || scoreboard[:computer] == 5
  end

  prompt("The #{grand_champion?(scoreboard)} is the grand champion!!!")

  prompt('I hope you had a wonderful time playing!')
  prompt('Do you want to play again?')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
