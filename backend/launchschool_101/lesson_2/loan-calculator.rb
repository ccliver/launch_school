#!/usr/bin/env ruby

require 'optparse'

def calculate_monthly_payment(amount, monthly_interest, duration)
  amount * (monthly_interest / (1 - (1 + monthly_interest)**-duration))
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{$PROGRAM_NAME} [options]"
  opts.on('--amount x', Float, 'Loan amount') { |x| options[:amount] = x }
  opts.on('--apr x', Float, 'Annual Percentage Rage (ex: .05)') do |x|
    options[:apr] = x
  end
  opts.on('--duration x', Integer, 'Loan duration in years') do |x|
    options[:duration] = x
  end
end.parse!

amount = options[:amount]
duration = options[:duration] * 12
monthly_interest = options[:apr] / 12

payment = calculate_monthly_payment(amount, monthly_interest, duration)
puts "Monthly Payment: #{format('$%.2f', payment)}"
puts "Monthly APR: #{monthly_interest}"
