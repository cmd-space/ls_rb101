def check_number?(num)
  num.to_i.to_s == num && !num.to_i.empty?
end

def check_float?(flo)
  flo.to_f.to_s == flo && !flo.to_f.empty?
end

# Calculate the monthly payment
def calculate_monthly_payment(loan_amount, apr, duration)
  j = (apr.to_f / 12) / 100
  p = loan_amount.to_f
  n = duration.to_f
  monthly_payment = p * (j / (1 - (1 + j)**-n))
  monthly_payment.ceil(2)
end

puts 'Welcome to the monthly principal and interest payment calculator!'

# Main loop
loop do
  loan_amount = ''
  loop do
    puts 'Please enter the total loan amount as a whole number (eg: 100):'
    loan_amount = gets.chomp

    break if check_number?(loan_amount) && loan_amount.to_i.positive?

    puts 'It seems as though that was not a positive, whole number. Please try again.'
  end

  apr = ''
  loop do
    puts 'Please enter the APR as a decimal (eg: 10.0 for 10%):'
    apr = gets.chomp

    break if check_float?(apr)

    puts 'It seems aas though you did not enter a decimal. Please try again.'
  end

  duration = ''
  loop do
    puts 'Please enter the duration of the loan in months (eg: 60 for 5 years):'
    duration = gets.chomp

    break if check_number?(duration) && duration.to_i.positive?

    puts 'Please enter a valid whole number.'
  end

  puts calculate_monthly_payment(loan_amount, apr, duration)

  puts 'Go again? (Y/N)'

  break unless gets.chomp.downcase.start_with? 'y'
end
