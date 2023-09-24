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
  puts "    🧀 The Big Cheese HP: #{the_boss[:hp].to_i} #{'💜' * [the_boss[:hp] / 50, 0].max}"
  puts "    🧀 The Big Cheese Style: #{boss_style}"
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

def paid_blood_message(user_choice, price_paid, multiplier)
  four_messages = [
    "You sacked 🖤 #{price_paid} HP to swole up your 🛡️ block by 1.",
  ]
  five_messages = [
    "You bled 🖤 #{price_paid} HP but you raked in 💵 #{multiplier} cash. Worth it.",
  ]
  six_messages = [
    "🩸 Blood is thicker than 💧. You bled 🖤 #{price_paid} HP and removed 🍺 #{multiplier} beers.",
  ]
  seven_messages = [
    "You got what you wanted and munched up 💗 #{price_paid} HP, but you're bloated, your 🛡️ block suffers by #{multiplier}."
  ]

  case user_choice
  when 4
    puts four_messages.sample
  when 5
    puts five_messages.sample
  when 6
    puts six_messages.sample
  when 7
    puts seven_messages.sample
  end
end

def drained_message
  drained_msg = [
    "*******************🩸 Once per turn, you melt ‼ **********************",
    "*******************🩸 Uh-uh! I don't think so ‼ **********************",
    "*******************🩸 Don't get greedy ‼ *****************************",
    "*******************🩸 You've donated enough blood ‼ ******************",
    "*******************🩸 You had your chance, go fight now ‼ ************",
    "*******************🩸 Soz (Not sorry) ‼ ******************************",
    "*******************🩸 Next round buddy ‼ *****************************",
  ]

  print `clear`
  puts "----------------------------------------------------------------------"
  puts drained_msg.sample
  puts "----------------------------------------------------------------------"
end
