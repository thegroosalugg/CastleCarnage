# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Blackjack continue?

def continue
  puts SEPARATOR
  puts "    \e[32mWhat you want?\e[0m"
  puts "   🎰 [4] \e[32m𝓐𝓖𝓐𝓘𝓝\e[0m"
  puts "   💨 [5] \e[31mＮＡＨ\e[0m"
end

# Band > DanceOff && Band > KegStand && Barkeep > BlackJack

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
