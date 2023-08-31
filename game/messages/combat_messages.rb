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
