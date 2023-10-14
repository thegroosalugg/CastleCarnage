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

def draw_card(who, hand)
  messages = "\e[32m⼕闩尺ᗪ\e[0m #{who[:name]} drew #{hand.last[:suit]}"
  puts text_break(messages, " ", 80)
end

def whos_the_boss(your_hand, your_total, boss_total)
  win = "\e[32m山工𝓝𝓝㠪尺\e[0m"
  lose = "\e[31mＬＯＳＥＲ\e[0m"
  blackjack = "\e[38;5;208m乃㇄闩⼕长丿闩⼕长\e[0m"

  messages = if your_total == 21 && your_hand.length == 2 && boss_total != 21
    blackjack
  elsif your_total <= 21 && (your_total > boss_total || boss_total > 21)
    win
  else
    lose
  end
  puts text_break(messages, " ", 80)
end

def continue
  puts SEPARATOR
  puts "    What you want?"
  puts "   🎰 [4] \e[32m𝓐𝓖𝓐𝓘𝓝\e[0m"
  puts "   💨 [5] \e[31mＮＡＨ\e[0m"
end
