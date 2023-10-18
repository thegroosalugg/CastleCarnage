# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Main UI that displays all current happenings

def game_info(enemies, player)
  puts BARRIER_EN
  enemies.each { |enemy| display_bars(enemy) }
  puts move_ascii_art(player)
  display_bars(player)
  status(player)
  puts BARRIER
end

# Blackjack state of game

def whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.map { |card| card[:suit] } }
  w, x, y = [boss_hand.first[:value], boss_total, your_total].map { |n| n >= 10 ? "" : " " } # adds a single whitespace for single integer display

  puts BARRIER_EN
  puts whitespace(the_boss, " ", 30) + # whitespace generator so display is consistent regardless of name length
  "#{the_boss[:name]} #{MG}⟪#{w}#{boss_hand.first[:value]}⟫#{CL} ʃ #{boss_cards[0]}  🃏" unless player[:stuck]
  puts whitespace(the_boss, " ", 30) +
  "#{the_boss[:name]} #{MG}⟪#{x}#{boss_total}⟫#{CL} ʃ #{boss_cards.join(' ')}" if player[:stuck]
  puts whitespace(player, " ", 30) +
  "#{player[:name]} #{GN}⟪#{y}#{your_total}⟫#{CL} ʃ #{your_cards.join(' ')}"
end

def whos_the_boss(your_hand, your_total, boss_total)
  win =       SUCCESS
  lose =      FLUNKED + " now get out❗"
  blackjack = BLACKJACK

  messages = if your_total == 21 && your_hand.length == 2 && boss_total != 21
    blackjack
  elsif your_total <= 21 && (your_total > boss_total || boss_total > 21)
    win
  else
    lose
  end
  puts text_break(messages, " ", 80)
end
