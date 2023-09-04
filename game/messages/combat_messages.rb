# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# COMBAT MESSAGES

def weapon_broke(weapon)
  weapon_messages = [
    "😲 Bollocks, your #{weapon[:name]} slipped out of your hand and flew out of the window. Time to split!",
    "😲 The universe conspires against you. Your #{weapon[:name]} disintegrates into nothingness!",
    "😲 Your #{weapon[:name]} made its final stand and fell to pieces. You'll need a new one.",
    "😲 Well, that's a bummer! Your trusty #{weapon[:name]} just disintegrated into dust.",
    "😲 Goddamn it! You dropped your #{weapon[:name]}! No time to nab it, gotta bolt!",
    "😲 You used up your last shot, your #{weapon[:name]} is a paperweight.",
    "😲 Your #{weapon[:name]} jumped from your hand and legged it.",
    "😲 Your #{weapon[:name]} broke 💔, time to take a walk.",
    "😲 Oh shit! Your #{weapon[:name]} broke. Better leg it!",
    "😲 Your #{weapon[:name]} disappears into thin air",
  ]

  puts weapon_messages.sample
end

# Player attack

def crt_dmg_msg(enemy, weapon, critical_damage)
  crt_messages = [
    "You did a running jump and 💥 critical kicked #{enemy[:name]} in their stupid face for 💢 #{critical_damage.to_i} damage",
    "💥 Critical ‼ You smashed #{enemy[:name]} with your #{weapon[:name]} for 💢 #{critical_damage.to_i} damage!",
    "⬇ ⬆ LP ⬅ ⬅ ⬆ ⬇ LK HP ⬇ ↘ ➡ HP HK LP  ⬅ ↙ ⬇ ⬅  ↙ ⬇ :: 💥 #{critical_damage.to_i} critical damage!",
  ]

  puts crt_messages.sample
end

def missed(enemy)
  missed_msg = [
    "As you swing, you miss and #{enemy[:name]} layed you flat out 😵. You kissed the floor. You're married to the floor.",
    "While charging the enemy you wanked it up and fell on your face 😣, dealing absolutely no damage. You plank.",
    "You fucked up. Enjoy your zero cola 🥶 with your zero damage sucka.",
  ]

  puts missed_msg.sample
end

def attack_msg(enemy, weapon, damage_dealt)
  atk_msg = [
    "A brutal hit! #{enemy[:name]} takes a beating from your #{weapon[:name]}, suffering 💥 #{damage_dealt} damage!",
    "You threw your trusty #{weapon[:name]} at #{enemy[:name]} for 💢 #{damage_dealt} damage! Nice shot bro!",
    "You grabbed #{enemy[:name]} and smashed them through the wall for 💢 #{damage_dealt} damage!",
    "You trounced #{enemy[:name]} with your #{weapon[:name]} for 💢 #{damage_dealt} damage!",
    "You wrecked #{enemy[:name]} with your #{weapon[:name]} for 💢 #{damage_dealt} damage!",
    "You merked #{enemy[:name]} with your #{weapon[:name]} for 💢 #{damage_dealt} damage!",
    "#{weapon[:name]} #{enemy[:name]} for 💢 #{damage_dealt} damage!",
  ]

  puts atk_msg.sample
end

# Enemy attack

def enemy_crt_msg(enemy, enemy_critical)
  enemy_crt_msg = [
    "Oh Shit! #{enemy[:name]} battered you for #{enemy_critical.to_i} 💥 critical damage! You look like mashed potatoes mate!",
    "#{enemy[:name]}: ⬅ ↖ ⬆ ↗ ➡ HP ⬅ ➡ 🅾 LP LK ⬅ ↙ ⬇ ↘ ➡ HK :: You took 💥 #{enemy_critical.to_i} critical damage.",
    "#{enemy[:name]} did a crazy as flip and kicked you for 💥 #{enemy_critical.to_i} critical damage",
    "#{enemy[:name]} did a sick combo on you for 💥 #{enemy_critical.to_i} critical damage.",
  ]

  puts enemy_crt_msg.sample
end

def enemy_missed(enemy)
  enemy_missed_msg = [
    "#{enemy[:name]} jumped at you and fell out the window, completely missing ❕ #{enemy[:name]} flew back in!",
    "#{enemy[:name]} fired ♨ Mega Blast, you dodged like a 😎 badman and tipped your fedora, no damage!",
    "You danced away 💃🏽 from #{enemy[:name]}'s attack, leaving them swinging at thin air!",
    "#{enemy[:name]} got confused and ran straight into a wall 😣, you got lucky.",
    "You jumped over 🦘 #{enemy[:name]}, avoiding them like an ex in a mall.",
    "Your stealth 🐱‍👤 is spot on, you avoided #{enemy[:name]}'s mashing up!",
    "You hid in an earn 🏺. #{enemy[:name]} couldn't find you.",
    "You ✨ teleported and avoided #{enemy[:name]}'s attack.",

  ]

  puts enemy_missed_msg.sample
end

def enemy_attack_msg(enemy, enemy_damage)
  enemy_atk_msg = [
    "#{enemy[:name]} battered you for 💢 #{enemy_damage} damage! You're getting merked!",
    "The #{enemy[:name]} smashed you for 💢 #{enemy_damage} damage! Better think fast!",
    "#{enemy[:name]} kicked you in the face for 💢 #{enemy_damage} damage!",
    "#{enemy[:name]} roughed you up for 💢 #{enemy_damage} damage!",
    "#{enemy[:name]} weighed you in for 💢 #{enemy_damage} damage!",
    "#{enemy[:name]} wrecked you for 💢 #{enemy_damage} damage!",
  ]

  puts enemy_atk_msg.sample
end

# Sommersault attack

def sommersault_success(enemy, weapon)
  success_msg = [
    "You turned Super Saiyan 😼, the scouter 🥽 says your power level is over 9000 ‼",
    "You ran up the wall and did a sick backflip, you strike #{enemy[:name]} twice!",
    "⬇ ↘ ➡ HP LP ⬅ ↖ ⬆ LP ⬆ ↖ ⬅ HK  ⬇ LK HP  ⬇ ↘ ➡ ➡ ⬆ ⬇ HK :: Ultra Combo...",
    "With outcomes like these 💯 you might win after all, roll 🎲 twice!",
    "Bang on ⚖. You get 2 attacks!",
  ]

  puts success_msg.sample
end

def sommersault_fail(enemy)
  fail_msg = [
    "You stacked 😵 it! #{enemy[:name]} is gonna have a field day, you plum!",
    "You shouldn't have eaten 3 pizzas 🍕 before trying to do acrobatics 🤢.",
    "You tripped over your own shoelaces 👞 and knocked yourself out 😵.",
    "You're still pretty wasted 🍻, you can't even stand straight.",
    "#{enemy[:name]} laughed 😂 and socked 👊 you in the face.",
  ]

  puts fail_msg.sample
end

# Explore rooms attack

def random_attack_message(enemy)
  messages = [
    "🙈You stacked it on your way out and let #{enemy[:name]} get the drop on you, watch out!",
    "#{enemy[:name]} did a mental 🐱‍🏍 backflip and landed in front of you!",
    "👥You tried to leg it but #{enemy[:name]} jumped ya. Bugger it.",
    "You slipped on a 🍌 banana and #{enemy[:name]} jumped you!",
    "#{enemy[:name]} is faster 💨 than you. You get merked.",
    "#{enemy[:name]}: 'Yar think ye can get away from me?'",
    "#{enemy[:name]} ✨ teleports in front of the door",
    "#{enemy[:name]}: 'Oi, stop and I'll shoot yar!'",
    "#{enemy[:name]}: 'Get back 'ere yer scum!'",
    "#{enemy[:name]}: 'Oi, give us 5 bucks!",
  ]

  puts messages.sample
end

# Enemy killed

def enemy_killed(enemy)
  enemy_messages = [
    "#{enemy[:name]} took the 🚂 midnight train to slab city.",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} turned into a ghost, whooo 👻",
    "#{enemy[:name]} died. 🎯 Bully for you!",
    "#{enemy[:name]}: 'Argh, yar got me!'",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} was defeated ☠",
    "#{enemy[:name]} got shanked 🗡",
    "#{enemy[:name]} got got 💀",
    "You knocked #{enemy[:name]}'s head clean off.",
    "You blasted #{enemy[:name]}! Flawless 💎 Victory.",
  ]

  puts "----------------------------------------------------------------------"
  puts enemy_messages.sample
end
