# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card suits
  royals = { "K" => 10, "Q" => 10, "J" => 10, "A" => 11 } # Define suit cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |suit| # Add numbered cards to the deck
    values.each do |value|
      card = { suit: "#{suit} #{value}", value: value }
      deck << card
    end
  end

  suits.each do |suit| # Add suit cards to the deck
    royals.each do |name, value|
      card = { suit: "#{suit} #{name}", value: value }
      deck << card
    end
  end

  deck.shuffle! # Shuffle the deck
end

def blackjack(player, the_boss)
  deck
  boss_hand = []
  your_hand = []

  boss_hand << deck.shift(2)
  your_hand << deck.shift(2)

  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.flatten.map { |card| card[:suit] } }
  boss_total, your_total = [boss_hand, your_hand].map { |hand| hand.flatten.sum { |card| card[:value] } }

  puts "Boss: #{boss_cards.join(', ')} (Total: #{boss_total})"
  puts " You: #{your_cards.join(', ')} (Total: #{your_total})"
end
