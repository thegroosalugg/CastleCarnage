# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def card_deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card suits
  royals = { "K" => 10, "Q" => 10, "J" => 10, "A" => 11 } # Define suit cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |suit| # Add numbered cards to the deck
    values.each do |value|
      card = { suit: "#{value}#{suit}", value: value }
      deck << card
    end
  end

  suits.each do |suit| # Add suit cards to the deck
    royals.each do |name, value|
      card = { suit: "#{name}#{suit}", value: value }
      deck << card
    end
  end

  deck.shuffle! # Shuffle the deck
end

def whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.map { |card| card[:suit] } }

  puts "Boss: #{boss_cards[0]} 🎴  (Total: #{boss_hand.first[:value]})"
  puts "Boss: #{boss_cards.join(' ')} (Total: #{boss_total})"
  puts " You: #{your_cards.join(' ')} (Total: #{your_total})"
end

def check_ace(hand, total)
  if hand.last[:value] == 11 && total > 21
    hand.last[:value] = 1
    total -= 10
  end
  [hand, total]
end

def blackjack(player, the_boss)
  deck = card_deck
  boss_hand, your_hand = [], []

  [boss_hand, your_hand].each { |hand| 2.times { hand << deck.shift } } # starting hands, draw 2 cards each
  boss_total, your_total = [boss_hand, your_hand].map { |hand| hand.sum { |card| card[:value] } } # get total hand value

  your_hand, your_total = check_ace(your_hand, your_total)
  boss_hand, boss_total = check_ace(boss_hand, boss_total)

  while your_total < 21
    print `clear`
    deck = card_deck if deck.empty?
    whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
    puts "Press 4 to Hit or 5 to Stick"
    user_action = gets.chomp

    if user_action == "4"
      your_hand << deck.shift
      your_total = your_hand.sum { |card| card[:value] }
      your_hand, your_total = check_ace(your_hand, your_total)
      whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
    elsif user_action == "5"
      break
    end
  end
end
