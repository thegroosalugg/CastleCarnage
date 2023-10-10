# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Blackjack state of game

def whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.map { |card| card[:suit] } }
  w, x, y = [boss_hand.first[:value], boss_total, your_total].map { |n| n >= 10 ? "" : " " } # adds a single whitespace for single integer display

  puts SEPARATOR
  puts whitespace(the_boss, " ", 30) + # whitespace generator so display is consistent regardless of name length
  "#{the_boss[:name]} ⟪#{w}#{boss_hand.first[:value]}⟫ ʃ #{boss_cards[0]}  🃏" unless player[:stuck]
  puts whitespace(the_boss, " ", 30) +
  "#{the_boss[:name]} ⟪#{x}#{boss_total}⟫ ʃ #{boss_cards.join(' ')}" if player[:stuck]
  puts whitespace(player, " ", 30) +
  "#{player[:name]} ⟪#{y}#{your_total}⟫ ʃ #{your_cards.join(' ')}"
end

def draw_card(hand)
  card = hand.last[:suit]
  messages = [
    "You drew #{card}, good for you",
  ]

  puts text_break(messages.sample, " ", 70)
end
