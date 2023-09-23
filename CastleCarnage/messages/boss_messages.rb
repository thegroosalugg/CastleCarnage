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

def game_info(player, the_boss, boss_style)
  puts "----------------------------------------------------------------------"
  puts "    🧀 The Big Cheese HP: #{the_boss[:hp].to_i} #{'💜' * [the_boss[:hp] / 30, 0].max}"
  puts "    🧀 The Big Cheese Style: #{boss_style}"
  puts "    💖 Your HP: #{player[:hp].to_i} #{'❤️' * [player[:hp] / 30, 0].max}"
  puts "    💰 Wallet: #{player[:cash]} #{'💵' * [player[:cash] / 5, 0].max}" if boss_style == "🍻 Barkeep"
  puts "    🥴 Drunk: #{player[:drunk]} #{'🍺' * player[:drunk]}" if boss_style == "🍻 Barkeep"
  puts "----------------------------------------------------------------------"
end

def damage_info(the_boss, boss_style, damage, multiplier)
  puts "You damaged 🧀 The Big Cheese #{boss_style} for #{damage} with a mutiplier of #{multiplier}"
end