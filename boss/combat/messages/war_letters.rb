# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Whitespace generator so display stays in same place regardless of name length

def whitespace(entity, char, size)
  char * (size - entity[:name].length)
end

# Invoice for stat changes
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def invoice(player, amount, where)
  got_drunk = [ # bar fight
    "Damn, that was a piss up, you feel #{amount[0]} 🍺 drunker.",
  ]
  sober_up = [
    "That knocked some sense into ya, ya feel you feel #{amount[0].abs} 🍺 lighter!",
  ]
  got_cash = [
    "You battered #{amount[1]} 💵 outta some poor sod!",
  ]
  got_mugged = [
    "You got mugged for #{amount[1].abs} 💵",
  ]
  bar = [ # pay the tab
    "You doled out #{amount} 💵 and ate up #{amount} 🍺 drinks. Time for some dishing.",
  ]
  skint = [
    "You're too skint to get a drink, the damage you deal is reduced.",
  ]
  xcore = [ # xhardcorex
    "You got trampled and lost #{amount} 💵 your damage is reduced.",
  ]
  broke = [
    "You're skint and got nothing to lose, but that don't mean you can't take extra damage!",
  ]
  pit = [ # mosh pit
    case player[:drunk]
    when 0..2   then "You're well knackered 😩 your damage is hemel."
    when 3..5   then "Got a buzz on 😉 you start to headbang!"
    when 6..9   then "One sixer sunk, getting the two-step on."
    when 10..13 then "Whisky 🥃 armour on. Time to start windmilling ☠️"
    when 14..17 then "You feel invincible, nothins guna stp u nw 🤤 "
    when 18..20 then "🍺🍻😏🤪🥳😉🥴🤤😵"
    end
  ]
  guard = [ # not tonight
    "Your weapon provided an extra #{amount} 🛡️ block, better use it wisely.",
  ]
  life = [ # sneak attack
    "Oi, oi, you lucky people, you swagged #{player[:emoji]} #{amount} HP along the way, you sneaky 👟 bastard!",
  ]
  cash = [
    "You ganked a hefty bit of loot, #{amount} 💵 for your pocket. Spend it wisely!",
  ]

  messages = case where
  when :brawl # bar fight
    beers = amount[0].positive? ? got_drunk : sober_up
    cash = amount[1].positive? ? got_cash : got_mugged
    [[beers.sample, cash.sample].join(' ')]
  when :tab   then amount.zero? ? skint : bar # pay the tab
  when :xcore then amount.zero? ? broke : xcore # xhardcorex
  when :pit   then pit # mosh pit
  when :club  then guard # not tonight
  when :life  then life # sneak attack
  when :cash  then cash
  end
  puts text_break(messages.sample, " ", 70)
end

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

# Band boss style > when 5 & 6. Barkeep boss style when 6.

def step_on_up(method)
  puts SEPARATOR
  puts "    Show your moves..."
  if method == :dance
    puts "[4] 🧊 Blue Steel"
    puts "[5] 🐯 Le Tigre"
    puts "[6] 🍦 Magnum"
  elsif method == :keg
    puts "[4] ♨️ Firestarter"
    puts "[5] ❄️ Cold as Ice"
  elsif method == :cards
    puts "[4] 🃏 Hit me!"
    puts "[5] 🪂 I'm out!"
  end
end

def show_your_moves(player, the_boss, user_moves, boss_moves, method)
  moves = {
    4 => "🧊 Blue Steel",
    5 => "🐯  Le Tigre ",
    6 => "🍦   Magnum  "
  }
  drinks = {
    4 => "♨️ Firestarter",
    5 => "❄️ Cold as Ice"
  }
  lose = [
    "#{the_boss[:name]} got mad style 💫 The crowd is going mental.",
    "The crowd 🤺🏃🕴️ is chanting for #{the_boss[:name]}, they thirst for blood",
  ]
  win = [
    "With the grace of a falcon 🦅 you're stealing the show",
    "#{the_boss[:name]} is getting served with your mental moves",
  ]
  draw = [
    "You both suck and slap 🤚 each other in the face mid spin."
  ]

  messages = ""

  if method == :dance
    boss_moves.each_with_index do |boss, round|
      user = user_moves[round]
      messages = case
      when boss == 4 && user == 6 then lose
      when boss == 6 && user == 4 then win
      when boss < user  then win
      when boss > user  then lose
      when boss == user then draw
      end
      x = messages == win ? "✅" : "❌"
      puts whitespace(player, " ", 16) + "#{player[:name]} 💬 ⟪#{moves[user]}⟫ #{x} ⟪#{moves[boss]}⟫ 🗨️ #{the_boss[:name]}"
    end
  elsif method == :keg
    messages = (user_moves == boss_moves ? lose : win)
    x = user_moves == boss_moves ? "❌" : "✅"
    puts whitespace(player, " ", 16) + "#{player[:name]} 💬 ⟪#{drinks[user_moves]}⟫ #{x} ⟪#{drinks[boss_moves]}⟫ 🗨️ #{the_boss[:name]}"
  end
  puts SEPARATOR
  puts text_break(messages.sample, " ", 70)
end
