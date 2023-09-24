# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def damage_info(the_boss, boss_style, damage, multiplier)
  puts "You damaged 🧀 The Big Cheese #{boss_style} for #{damage} with a multiplier of #{multiplier}"
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
