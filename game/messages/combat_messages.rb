# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# COMBAT MESSAGES

def weapon_broke(weapon)
  weapon_messages = [
    "😲 Oh shit! Your #{weapon[:name]} broke. Better leg it!",
    "😲 Motherfucker! you dropped your #{weapon[:name]}! No time to nab it, gotta bolt!",
    "😲 Bollocks, your #{weapon[:name]} slipped out of your hand and flew out of the window. Time to split!"
  ]

  puts weapon_messages.sample
end

# Player attack

def crt_dmg_msg(enemy, weapon, critical_damage)
  crt_messages = [
    "💥 Critical ‼ You smashed #{enemy[:name]} with your #{weapon[:name]} for 💢 #{critical_damage.to_i} damage!",
    "You did a running jump and 💥 critical kicked #{enemy[:name]} in their stupid face for 💢 #{critical_damage.to_i} damage",
  ]

  puts crt_messages.sample
end

def missed(enemy)
  missed_msg = [
    "While charging the enemy you wanked it up and fell on your face 😣, dealing absolutely no damage. You plank.",
    "You fucked up. Enjoy your zero cola 🥶 with your zero damage sucka.",
    "As you swung you missed and #{enemy[:name]} knocked you the fuck out 😵. You kissed the floor. You're married to the floor.",
  ]

  puts missed_msg.sample
end

def attack_msg(enemy, weapon, damage_dealt)
  atk_msg = [
    "You trounced #{enemy[:name]} with your #{weapon[:name]} for 💢 #{damage_dealt} damage!",
    "You threw your trusty #{weapon[:name]} at #{enemy[:name]} for 💢 #{damage_dealt} damage! Nice shot bro!",
  ]

  puts atk_msg.sample
end

# Enemy attack

def enemy_crt_msg(enemy, enemy_critical)
  enemy_crt_msg = [
    "Oh Shit! #{enemy[:name]} battered you for #{enemy_critical.to_i} 💥 critical damage! You look like mashed potatoes mate!",
    "#{enemy[:name]}: ↖ LP ⬆️ ↗ HP ⬅️ 🅾️ ➡️ ↙ LK ⬇️ ↘ HK => You took 💥 #{enemy_critical.to_i} critical damage",
  ]

  puts enemy_crt_msg.sample
end

def enemy_missed(enemy)
  enemy_missed_msg = [
    "#{enemy[:name]} got confused and ran straight into a wall 😣, you got lucky.",
    "#{enemy[:name]} fired ♨ Mega Blast, you dodged like a 😎 badman and tipped your fedora, no damage!",
  ]

  puts enemy_missed_msg.sample
end

def random_attack_message(enemy)
  messages = [
    "👥You tried to leg it but #{enemy[:name]} jumped ya. Bugger it.",
    "🙈You stacked it on your way out and let #{enemy[:name]} get the drop on you, watch out!",
    "#{enemy[:name]} ✨ teleports in front of the door",
    "You slipped on a 🍌 banana and #{enemy[:name]} jumped you!",
    "#{enemy[:name]} did a mental 🐱‍🏍 backflip and landed in front of you!",
    "#{enemy[:name]}: 'Get back 'ere yer scum!'",
    "#{enemy[:name]}: 'Yar think ye can get away from me?'",
    "#{enemy[:name]}: 'WAIT UP! I HAVE A QUESTION FOR YOU! DIE!!'",
  ]

  puts messages.sample
end

def enemy_killed(enemy)
  enemy_messages = [
    "#{enemy[:name]} died. 🎯 Bully for you!",
    "You blasted #{enemy[:name]}! 💎 Flawless Victory.",
    "#{enemy[:name]} got got 💀",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} got gatted 🤺",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} took the 🚂 midnight train to slab city",
    "#{enemy[:name]} turned into a ghost, whooo 👻",
    "You knocked #{enemy[:name]}'s head clean off."
  ]
  puts "----------------------------------------------------------------------"
  puts enemy_messages.sample
end
