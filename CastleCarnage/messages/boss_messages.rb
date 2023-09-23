# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def boss_menu
  puts "----------------------------------------------------------------------"
  puts "Select battle method"
  puts "[4] 👊⚡ Fight the Power"
  puts "[5] 🩸🪄 Blood Magic"
  puts "[6] "
  puts "[7] "
end

def game_info(player, the_boss, boss_style, load_boss)
  puts "----------------------------------------------------------------------"
  puts "    🧀 The Big Cheese HP: #{the_boss[:hp].to_i} #{'💜' * [the_boss[:hp] / 50, 0].max}"
  puts "    🧀 The Big Cheese Style: #{boss_style}"
  puts "----------------------------------------------------------------------"
  puts "    #{player_bars(player)}"
  puts "    💰  Wallet: #{'💵' * [player[:cash], 0].max}"
  puts "    🥴🍾 Drunk: #{'🍺' * [player[:drunk], 0].max}"
  puts "----------------------------------------------------------------------"
  puts load_boss
end

def fight_menu(boss_style)
  puts "----------------------------------------------------------------------"
  if boss_style == "🍻 Barkeep"
    puts "[4] 💴🗒️ Settle your Tabs"
    puts "[5] 🚖🚫 Designated Driver Mode"
  end
end

def damage_info(the_boss, boss_style, damage, multiplier)
  puts "You damaged 🧀 The Big Cheese #{boss_style} for #{damage} with a multiplier of #{multiplier}"
end

def blood_menu
  puts "----------------------------------------------------------------------"
  puts "-------------- 🧞:'Pay with Blood ❤️, Get Swag 💰'-------------------"
  puts "[4] 💪 Buff up!"
  puts "[5] 💵 Get Money"
  puts "[6] 🥤 Bottle of Water and some 💊 Ibuprofen"
  puts "[7] 🍔 Order a take away"
end
