# frozen_string_literal: true

VALID_CHOICES = %w[rock r paper p scissors sc lizard l spock sp].freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && %w[scissors lizard].include?(second)) ||
    (first == 'paper' && %w[rock spock].include?(second)) ||
    (first == 'scissors' && %w[paper lizard].include?(second)) ||
    (first == 'lizard' && %w[spock paper].include?(second)) ||
    (first == 'spock' && %w[scissors rock].include?(second))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('The computer won!')
  else
    prompt('It\'s a tie!')
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

loop do
  choice = ''
  loop do
    prompt('Choose from the following')
    prompt('The option to the right of each choice can be used for ease')
    prompt("#{VALID_CHOICES.join(', ')}")
    choice = convert_choice!(gets.chomp)

    break if VALID_CHOICES.include?(choice)

    prompt('That is not a valid choice. Please try again.')
  end

  computer_choice = convert_choice!(VALID_CHOICES.sample)

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
