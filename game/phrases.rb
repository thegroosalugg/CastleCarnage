# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro_enemy(enemy)
  enemy_phrases = [
    "#{enemy[:name]} busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
    "You got proper pissed 🍷 and ended up in some 🏰 castle, a #{enemy[:name]} jumped from the ceiling, 'You goon get it now boy!'",
    "You got caught ganking 🍻 hooch from the 🏡 package store, the 👩🏿‍🤝‍🧑🏿👨🏽‍🤝‍👨🏼townsfolk set the #{enemy[:name]} on you!"
  ]

  puts enemy_phrases.sample
end

def intro_weapon(weapon, enemy)
  weapon_phrases = [
    "There's a #{weapon[:name]} on the floor, better get that. We won't get got, we gone get!",
    "You pull out your trusty #{weapon[:name]} from your trench coat and tip your fedora, 'The only thing sharper than my #{weapon[:name]} is my wit m'lady'",
    "You ✨teleport behind #{enemy[:name]} and withdraw your #{weapon[:name]}, 'Nothing personnel, kid'"
  ]

  puts weapon_phrases.sample
end

# GAME STATUS

def state_of_game(enemy, second_enemy, player, weapon)
  puts "----------------------------------------------------------------------"
  puts "    #{enemy[:name]} HP: #{enemy[:hp].to_i}" if enemy
  puts "    #{second_enemy[:name]} HP: #{second_enemy[:hp].to_i}" if second_enemy
  puts "    💖 Your HP: #{player[:hp].to_i}"
  puts "    ⚔  Weapon: #{weapon[:name]} [DEBUG: #{weapon[:durability]}]" if weapon[:durability] > 0
  puts "----------------------------------------------------------------------"
end

# ERROR MESSAGES

def error_message
  errors = [
    "***********************❌ Don't be a pillock ‼ ***********************",
    "***********************❌ Don't be a plum ‼ **************************",
    "***********************❌ Don't be a plank ‼ *************************",
    "***********************❌ Don't be a plonka ‼ ************************",
    "***********************❌ Don't be a fool ‼ **************************",
    "***********************❌ Quit clowning around ‼ *********************",
    "***********************❌ Nobody likes a joker ‼ *********************",
  ]

  print `clear`
  puts "----------------------------------------------------------------------"
  puts errors.sample
  puts "----------------------------------------------------------------------"
end

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
    "You fucked up. Enjoy your zero cola with your zero damage sucka.",
    "As you swang a punch but #{enemy[:name]} blocked you and counterpunched you right in the nose, you kissed the floor",
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
  ]

  puts messages.sample
end

def enemy_killed(enemy)
  enemy_messages = [
    "#{enemy[:name]} died. 🎯 Bully for you!",
    "You blasted #{enemy[:name]}! 💎 Flawless Victory.",
    "#{enemy[:name]} got got 👀",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} got gatted 🤺",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} took the 🚂 midnight train to slab city",
    "#{enemy[:name]} turned into a ghost, whooo 👻",
  ]
  puts "----------------------------------------------------------------------"
  puts enemy_messages.sample
end

# END OF GAME MESSAGES

def win_message(enemy)
  win_messages = [
    "You blasted #{enemy[:name]} to another dimension. Your power level has increased.",
    "You splatted the #{enemy[:name]} like a bug, flawless victory.",
    "#{enemy[:name]} had a sudden heart attack, you win by default."
  ]

  puts win_messages.sample
  puts "----------------------------------------------------------------------"
end

def lose_message(enemy)
  lose_messages = [
    "You Died! #{enemy[:name]} shall feast on your entrails.",
    "#{enemy[:name]} ripped your head off. You won't be coming home for dinner.",
    "You stacked it and fell on a spike. #{enemy[:name]} laughs at your misfortune."
  ]

  puts lose_messages.sample
  puts "----------------------------------------------------------------------"
end
