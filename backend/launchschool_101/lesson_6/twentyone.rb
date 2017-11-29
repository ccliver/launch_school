#!/usr/bin/env ruby
# You start with a normal 52-card deck consisting of the 4 suits
# (hearts, diamonds, clubs, and spades),
# and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace).
#
# The goal of Twenty-One is to try to get as close to 21 as possible,
# without going over. If you go over 21, it's a "bust" and you lose.
#
# Setup: the game consists of a "dealer" and a "player".
# Both participants are initially dealt 2 cards.
# The player can see their 2 cards, but can only see one of the dealer's cards.
#
# Card               Value
# 2 - 10             fAce value
# Jack, Queen, King  10
# Ace                1 or 11

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  [
    ['H', 2], ['H', 3], ['H', 4], ['H', 5],
    ['H', 6], ['H', 7], ['H', 8], ['H', 9], ['H', 10],
    ['H', 'Jack'], ['H', 'Queen'], ['H', 'King'], ['H', 'Ace'],
    ['D', 2], ['D', 3], ['D', 4], ['D', 5],
    ['D', 6], ['D', 7], ['D', 8], ['D', 9], ['D', 10],
    ['D', 'Jack'], ['D', 'Queen'], ['D', 'King'], ['D', 'Ace'],
    ['C', 2], ['C', 3], ['C', 4], ['C', 5],
    ['C', 6], ['C', 7], ['C', 8], ['C', 9], ['C', 10],
    ['C', 'Jack'], ['C', 'Queen'], ['C', 'King'], ['C', 'Ace'],
    ['S', 2], ['S', 3], ['S', 4], ['S', 5],
    ['S', 6], ['S', 7], ['S', 8], ['S', 9], ['S', 10],
    ['S', 'Jack'], ['S', 'Queen'], ['S', 'King'], ['S', 'Ace']
  ]
end

def deal_card(deck)
  deck.delete(deck.sample).to_ary
end

def calculate_hand(cards)
  total = 0
  values = cards.map { |card| card[1] }

  values.each do |value|
    break if total >= 21
    if value == 'Ace'
      total += 11
    elsif value.is_a?(Integer)
      total += value
    else
      total += 10
    end
  end
  values.select { |value| value == 'Ace' }.count.times { total -= 10 if total > 21 }
  total
end

def busted?(total)
  total > 21
end

def display_player_cards(cards)
  hand = cards[0..-2].map { |card| card[1] }.join(', ')
  prompt("You have: #{hand} and #{cards[-1][1]}.")
end

def display_dealer_cards(cards)
  hand = cards[0..-2].map { |card| card[1] }.join(', ')
  prompt("Dealer is showing: #{hand} and an unknown card.")
end

def display_results(dealer_total, player_total, dealer_cards, player_cards)
  puts "\n"
  display_player_cards(player_cards)
  prompt("Player total: #{player_total}")
  display_dealer_cards(dealer_cards)
  prompt("Dealer total: #{dealer_total}")

  if player_total > dealer_total && player_total <= 21
    prompt("Player wins with #{player_total}!")
  elsif dealer_total > player_total && dealer_total <= 21
    prompt("Dealer wins with #{dealer_total}!")
  else
    prompt("It's a tie!")
  end
end

def play_again?
  prompt("----------------------------------")
  prompt("Do you want to play again? (y or n)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

## Main game loop.
loop do
  ## Initialize cards and deal.
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_cards << deal_card(deck)
  player_cards << deal_card(deck)
  dealer_cards << deal_card(deck)
  dealer_cards << deal_card(deck)

  display_dealer_cards(dealer_cards)
  display_player_cards(player_cards)

  ## Player turn.
  loop do
    prompt('(h)it or (s)tay?')
    ans = gets.chomp
    break if ans == 's' || busted?(calculate_hand(player_cards))
    player_cards << deal_card(deck)
    display_player_cards(player_cards)
  end
  player_total = calculate_hand(player_cards)

  if busted?(player_total)
    prompt('You lose!')
    break unless play_again?
  else
    prompt('You chose to stay!')
    prompt("Dealer's turn:")
  end

  ## Dealer turn.
  loop do
    dealer_total = calculate_hand(dealer_cards)
    break if dealer_total >= 17 || busted?(dealer_total)
    dealer_cards << deal_card(deck)
  end
  dealer_total = calculate_hand(dealer_cards)
  display_dealer_cards(dealer_cards)

  display_results(dealer_total, player_total, dealer_cards, player_cards)

  break unless play_again?
end
