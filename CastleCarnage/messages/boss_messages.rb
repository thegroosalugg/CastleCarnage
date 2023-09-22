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

def game_info(player, the_boss, boss_type)
  puts "----------------------------------------------------------------------"
  puts "    🧀 The Big Cheese HP: #{the_boss[:hp].to_i} #{'💜' * [the_boss[:hp] / 30, 0].max}"
  puts "    🧀 The Big Cheese Type: #{boss_type}"
  puts "    💖 Your HP: #{player[:hp].to_i} #{'❤️' * [player[:hp] / 30, 0].max}"
  puts "----------------------------------------------------------------------"
end

def damage_info(the_boss, boss_type, damage, multiplier)
  puts "You damaged 🧀 The Big Cheese #{boss_type} for #{damage} with a mutiplier of #{multiplier}"
end
