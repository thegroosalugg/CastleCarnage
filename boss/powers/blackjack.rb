# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card faces
  royals = { "Ķ" => 10, "ʠ" => 10, "J" => 10, "Ā" => 11 } # Define face cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |face| # Add numbered cards to the deck
    values.each do |value|
      card = { face: "#{face} #{value}", value: value }
      deck << card
    end
  end

  suits.each do |face| # Add face cards to the deck
    royals.each do |name, value|
      card = { face: "#{face} #{name}", value: value }
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

  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.flatten.map { |card| card[:face] } }
  boss_total, your_total = [boss_hand, your_hand].map { |hand| hand.flatten.sum { |card| card[:value] } }

  puts "Boss: #{boss_cards.join(', ')} (Total: #{boss_total})"
  puts " You: #{your_cards.join(', ')} (Total: #{your_total})"
end
