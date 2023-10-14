# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def invoice(player, amount, where, haul)
  x, y = case haul
  when :gained then ["+", [BONUS, HP_PLUS].join(" ")]
  when :lost   then ["-", HP_MINUS]
  end
   got_drunk = [ # bar fight
    "Damn, that was a piss up, you feel #{amount[0]} 🍺 more wasted.",
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
    "You doled out #{amount} 💵 and sunk #{amount} 🍺 bevvies. Time for some dishing.",
  ]
  skint = [
    "You're too skint to get a drink, the damage you deal is reduced.",
  ]
  cash = [ "#{CASH} #{x}#{amount} 💵" ]
  guard = [ # not tonight
    "Your weapon shielded #{amount} 🛡️ better use it wisely.",
  ]
  life = [ "#{y} #{player[:name]} #{x}#{amount} #{player[:emoji]}" ]

  messages = case where
  when :brawl # bar fight
    beers = amount[0].positive? ? got_drunk : sober_up
    cash = amount[1].positive? ? got_cash : got_mugged
    [[beers.sample, cash.sample].join(' ')]
  when :tab   then amount.zero? ? skint : bar # pay the tab
  when :cash  then cash
  when :club  then guard # not tonight
  when :life  then life # sneak attack
  end
  puts text_break(messages.sample, " ", 80)
end

# Band boss style > when 5 & 6. Barkeep boss style when 6.

def step_on_up(method)
  puts SEPARATOR
  puts "    Show your moves..."
  if method == :dance
    puts "    [4] 🧊 Blue Steel"
    puts "    [5] 🐯 Le Tigre"
    puts "    [6] 🍦 Magnum"
  elsif method == :keg
    puts "    [4] 🦎Charmander🔥"
    puts "    [5] 🐢 Squirtle 💧"
  elsif method == :cards
    puts "    [4] 🃏 Hit me!"
    puts "    [5] 🪂 I'm out!"
  end
end

def show_your_moves(player, the_boss, user_moves, boss_moves, method)
  moves = {
    4 => "🧊 BlueSteel",
    5 => "🐯 Le Tigre ",
    6 => "🍦 Magnum   "
  }
  drinks = {
    4 => "🦎Charmander🔥",
    5 => "🐢 Squirtle 💧"
  }

  if method == :dance
    boss_moves.each_with_index do |boss, round|
      user = user_moves[round]
      x = case
      when (user == 4 && boss == 6) then SUCCESS
      when (user == 6 && boss == 4) then FLUNKED
      when user > boss then SUCCESS
      when user < boss then FLUNKED
      else " #{MISSED}  "
      end
      puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{moves[user]} #{x} #{moves[boss]} 🗨️ #{the_boss[:name]}"
    end
  elsif method == :keg
    x = user_moves == boss_moves ? "#{SUCCESS}" : "#{FLUNKED}"
    puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{drinks[user_moves]} #{x} #{drinks[boss_moves]} 🗨️ #{the_boss[:name]}"
  end
  puts SEPARATOR
end
