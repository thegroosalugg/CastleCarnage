# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def invoice(player, amount, where, haul)
  x, y, z = case haul
  when :gained then ["+", "-", [BONUS, HP_PLUS].join(" ")]
  when :lost   then ["-", "+", HP_MINUS]
  end

  drunk = ["#{HANGOVER} #{y}#{amount}"]
  cash = ["#{CASH} #{x}#{amount} 💵"]
  guard = ["#{WEAPON} #{BONUS} +#{amount} 🛡️"]
  life = [ "#{z} #{player[:name]} #{x}#{amount} #{player[:emoji]}" ]

  messages = case where
  when :brawl then # bar fight
    # beers = amount[0].positive? ? got_drunk : sober_up
    # cash = amount[1].positive? ? got_cash : got_mugged
    # [[beers.sample, cash.sample].join(" ")]
  when :bar   then [[cash, drunk].flatten.join(" ")]
  when :cash  then cash # sneak attack / xhardcorex
  when :guard then guard # not tonight
  when :life  then life # sneak attack / necromancy
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
