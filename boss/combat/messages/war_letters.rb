# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def invoice(player, amount, where)
  messages = case where                             # this condition simply sets a + symbol in fron of positive integers
  when :brawl then "#{CASH} #{amount[0].positive? ? "+" : ""}#{amount[0]} 💵  #{HANGOVER} #{amount[1].positive? ? "+" : ""}#{amount[1]} 🍺"# bar fight
  when :bar   then "#{CASH} -#{amount} 💵  #{HANGOVER} +#{amount} 🍺" # pay the tab
  when :guard then "#{WEAPON} #{BONUS} +#{amount} 🛡️" # not tonight
  when :cash  then "#{CASH} +#{amount} 💵" # sneak attack / blackjack
  when :life  then "#{BONUS} #{HP_PLUS} #{player[:name]} +#{amount} #{player[:emoji]}" # sneak attack
  when :loss  then "#{CASH} -#{amount} 💵" # xhardcorex / blackjack
  when :grave then "#{HP_MINUS} #{player[:name]} -#{amount} #{player[:emoji]}" # nectromancy
  when :cards then "#{player[:name]} drew #{CARD} #{amount.last[:suit]}" # blackjack
  end
  puts text_break(messages, " ", 80)
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
