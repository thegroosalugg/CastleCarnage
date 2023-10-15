# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Blackjack continue?

def continue
  puts BARRIER
  puts "    #{GN}𝕩𝕠𝕡𝕠𝕨𝕒я иг𝕡𝕒, 𝕜𝕒𝕜 ℍ𝕒𝕔ч𝕖т д𝕡𝕪г𝕠й❔#{CL}"
  puts "   🎰 #{GN}[̳4̳]̳ Давай#{CL}"
  puts "   💨 #{RD}[̳5̳]̳ Пиздᴇц#{CL}"
end

# Band > DanceOff && Band > KegStand && Barkeep > BlackJack

def step_on_up(method)
  puts BARRIER
  puts "    Show your moves..."
  if method == :dance
    puts "    #{CN}[̳4̳]̳ 🧊 Blue Steel#{CL}"
    puts "    #{OR}[̳5̳]̳ 🐯 Le Tigre#{CL}"
    puts "    #{MG}[̳6̳]̳ 🍦 Magnum#{CL}"
  elsif method == :keg
    puts "    #{RD}[̳4̳]̳ 🦎Charmander🔥#{CL}"
    puts "    #{BL}[̳5̳]̳ 🐢 Squirtle 💧#{CL}"
  elsif method == :cards
    puts "    [̳4̳]̳ 🃏 Hit me!"
    puts "    [̳5̳]̳ 🪂 I'm out!"
  end
end

def show_your_moves(player, the_boss, user_moves, boss_moves, method)
  moves = {
    4 => "#{CN}🧊 BlueSteel#{CL}",
    5 => "#{OR}🐯 Le Tigre #{CL}",
    6 => "#{MG}🍦 Magnum   #{CL}"
  }
  drinks = {
    4 => "#{RD}🦎Charmander🔥#{CL}",
    5 => "#{BL}🐢 Squirtle 💧#{CL}"
  }

  if method == :dance
    boss_moves.each_with_index do |boss, round|
      user = user_moves[round]
      x = case
      when (user == 4 && boss == 6) then SUCCESS
      when (user == 6 && boss == 4) then FLUNKED
      when user > boss then SUCCESS
      when user < boss then FLUNKED
      else "🍃 #{MISSED}  🍂"
      end
      puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{moves[user]} #{x} #{moves[boss]} 🗨️ #{the_boss[:name]}"
    end
  elsif method == :keg
    x = user_moves == boss_moves ? "#{SUCCESS}" : "#{FLUNKED}"
    puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{drinks[user_moves]} #{x} #{drinks[boss_moves]} 🗨️ #{the_boss[:name]}"
  end
  puts BARRIER
end
