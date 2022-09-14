puts "Welcome to the loan calculator!"

def number?(num)
  p num
  p num.to_f.to_s
  p num.to_i.to_s
  (num == num.to_f.to_s) || (num == num.to_i.to_s)
end

loan_amount = ''
loop do
  puts "What is the loan amount?"
  loan_amount = gets.chomp
  if number?(loan_amount)
    break
  else
    puts "Invalid input. Please only put numbers and, if needed, a decimal."
  end
end
loan_amount = loan_amount.to_f

annual_percent_rate = ''
loop do
  puts "What is the Annual Percentage Rate (APR)?"
  annual_percent_rate = gets.chomp
  if number?(annual_percent_rate)
    break
  else
    puts "Invalid input. Please only put numbers and, if needed, a decimal."
  end
end
annual_percent_rate = annual_percent_rate.to_f
monthly_percent_rate = (annual_percent_rate / 12) / 100.0

loan_duration = ''
loop do
  puts "What is the duration of the loan (in months)?"
  loan_duration = gets.chomp
  if number?(loan_duration)
    break
  else
    puts "Invalid input. Please only put numbers and, if needed, a decimal."
  end
end
loan_duration = loan_duration.to_f

monthly_payment = loan_amount * (monthly_percent_rate /
  (1 - (1 + monthly_percent_rate)**((-1) * loan_duration)))
monthly_payment = monthly_payment.round(2)
puts "Your monthly payment is $#{monthly_payment}."
