# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def boss_menu
  puts "----------------------------------------------------------------------"
  puts "     Decisions, decisions..."
  puts "[4] 👊⚡ Fight the Power"
  puts "[5] 🩸🪄 Blood Magic"
end

def game_info(player, the_boss, boss_style, load_boss)
  puts "----------------------------------------------------------------------"
  puts "    🧀 The Big Cheese HP: #{the_boss[:hp].to_i} #{'💜' * [(the_boss[:hp] - 1) / 50 + 1, 0].max}"
  puts "                💫 Style: #{boss_style}"
  puts "----------------------------------------------------------------------"
  puts "    #{player_bars(player)}"
  puts "    💰  Wallet: [DEBUG #{player[:cash]}] #{'💵' * [player[:cash], 0].max}"
  puts "    🥴🍾 Drunk: [DEBUG #{player[:drunk]}] #{'🍺' * [player[:drunk], 0].max}"
  puts "----------------------------------------------------------------------"
  puts load_boss
end

def fight_menu(boss_style)
  puts "----------------------------------------------------------------------"
  if boss_style == "🍻 Barkeep"
    puts "[4] 💴🗒️ Settle your Tabs"
    puts "[5] 🪑🤺 Old School Bar Fight"
  end
end

def blood_menu
  puts "----------------------------------------------------------------------"
  puts "-------------- 🧞:'Pay with Blood ❤️, Get Swag 💰'-------------------"
  puts "[4] 💪 Buff up!"
  puts "[5] 💵 Get Money"
  puts "[6] 🥤 Bottle of Water and some 💊 Ibuprofen"
  puts "[7] 🍔 Order a take away"
end
