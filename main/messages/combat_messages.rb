# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# COMBAT MESSAGES

def weapon_broke(weapon)
  messages = [
    "😲 Bollocks, your #{weapon[:name]} slipped out of your hand and flew out of the window. Time to split!",
    "😲 You suddenly forgot how to wield your #{weapon[:name]}, it's useless now. You threw it away.",
    "😲 The universe conspires against you. Your #{weapon[:name]} disintegrates into nothingness!",
    "😲 Your #{weapon[:name]} made its final stand and fell to pieces. You'll need a new one.",
    "😲 Well, that's a bummer! Your trusty #{weapon[:name]} just disintegrated into dust.",
    "😲 Goddamn it! You dropped your #{weapon[:name]}! No time to nab it, gotta bolt!",
    "😲 You used up your last shot, your #{weapon[:name]} is a paperweight.",
    "😲 Your #{weapon[:name]} resigned from service. On your own now.",
    "😲 Your #{weapon[:name]} jumped from your hand and legged it.",
    "😲 Your #{weapon[:name]} was proper shoddy, sucks to be you.",
    "😲 Your #{weapon[:name]} broke 💔, time to take a walk.",
    "😲 Oh shit! Your #{weapon[:name]} broke. Better leg it!",
    "😲 Your #{weapon[:name]} disappears into thin air",
  ]

  puts SEPARATOR
  puts text_break(messages.sample, " ", 70)
end

# Player attack

def critical_hit(attacker, target, critical_damage)
  messages = [
    "Get ready for a battering, #{attacker[:name]} is gone do #{target[:name]} in for 💥 #{critical_damage} critical damage, #{target[:name]} is proper gutted bruv!",
    "Oh Shit! #{attacker[:name]} mashed #{target[:name]} up for #{critical_damage} 💥 critical damage! #{target[:name]} looks like mashed potatoes mate!",
    "#{attacker[:name]}: ⬇ ⬆ LP ⬅ ⬅ ⬆ ⬇ LK HP ⬇ ↘ ➡ HP HK LP  ⬅ ↙ ⬇ ⬅  ↙ ⬇ :: 💥 #{critical_damage} critical damage served to #{target[:name]}!",
    "#{attacker[:name]} did a mad front flip and volunteered #{target[:name]} to kiss the floor cleaning up 💥 #{critical_damage} critical damage!",
    "#{attacker[:name]}'s deadlift 🏋️‍♂️ regime has been righteous. The 💥 #{critical_damage} damage served to #{target[:name]} is a bit critical.",
    "#{attacker[:name]} did a running jump and kicked #{target[:name]} in their stupid face for 💥 #{critical_damage} critical damage.",
    "#{attacker[:name]} is just better than #{target[:name]}, they merk #{target[:name]} for 💥 #{critical_damage} critical damage.",
    "#{attacker[:name]} triple corked and double battered #{target[:name]} in the face for 💥 #{critical_damage} critical damage!",
    "#{attacker[:name]} turns up the punishment as #{target[:name]} gets weighed in for 💥 #{critical_damage} critical damage!",
    "#{attacker[:name]} did a sick combo on you for 💥 #{critical_damage} critical damage, fucking #{target[:name]} up!",
    "#{attacker[:name]} lit on fire 🔥 dishing out #{target[:name]} a meal of 💥 #{critical_damage} critical damage!",
    "#{attacker[:name]} did a crazy as flip and kicked #{target[:name]} for 💥 #{critical_damage} critical damage",
    "Critical‼ #{attacker[:name]} smashed #{target[:name]} for 💥 #{critical_damage} damage! Booya!",
  ]

  puts text_break(messages.sample, " ", 70)
end

def missed(attacker, target)
  messages = [
    "As #{attacker[:name]} swings, they miss and #{target[:name]} layed them flat out 😵. #{attacker[:name]} kissed the floor. #{attacker[:name]} is married to the floor.",
    "While charging #{target[:name]}, #{attacker[:name]} wanked it up and fell on their face 😣, dealing absolutely no damage. What a wally!",
    "#{attacker[:name]}'s stealth is like a brick 🧱 through a window. #{target[:name]} predicted the attack and calmly swayed out the way",
    "#{attacker[:name]} jumped at you and fell out the window, completely missing! #{attacker[:name]} had to climb back in!",
    "#{attacker[:name]} fired ♨ Mega Blast, #{target[:name]} dodged like a 😎 badman and tipped their fedora. No damage!",
    "#{target[:name]} laughs at #{attacker[:name]}'s efforts. Their attacks go down like Skittles 🍬🟣🟢🔴🟠🟡",
    "#{attacker[:name]} fucked up. #{attacker[:name]} sips their zero soda and zero damage meal combo 🍔🍟🥤",
    "#{target[:name]} danced away 💃🏽 from #{attacker[:name]}'s attack, leaving them swinging at thin air!",
    "#{attacker[:name]} got confused and ran straight into a wall 😣, #{target[:name]} got lucky.",
    "#{target[:name]} jumped over 🦘 #{attacker[:name]}, avoiding them like an ex in a mall.",
    "#{target[:name]}'s stealth 👟 is spot on, they avoided #{attacker[:name]}'s mashing up!",
    "#{target[:name]} hid in an earn 🏺. #{attacker[:name]} couldn't find 'em.",
    "Its not #{attacker[:name]}'s day today, they clumsily run into a wall 🧱",
    "#{target[:name]} ✨ teleported and avoided #{attacker[:name]}'s attack.",
    "#{target[:name]} don't give a fuck, they mash #{attacker[:name]} up!",
    "#{target[:name]}: '🚫 Denied‼'",
  ]

  puts text_break(messages.sample, " ", 70)
end

def succesful_hit(attacker, target, damage_dealt)
  messages = [
    "#{attacker[:name]} absolutely battered #{target[:name]} for 💢 #{damage_dealt} damage! #{target[:name]} got mashed up!",
    "School's in session. #{target[:name]} got teached by Professor 🧑‍🎓#{attacker[:name]} for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} slayed #{target[:name]} for 💢 #{damage_dealt} damage! #{target[:name]}'s getting merked!",
    "#{attacker[:name]} grabbed #{target[:name]} and smashed them through the wall for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} roughed #{target[:name]} up for 💢 #{damage_dealt} damage! Time to call for a doctor!",
    "#{attacker[:name]} absolutely wrecked #{target[:name]} for 💢 #{damage_dealt} damage! Who's the boss?!",
    "#{attacker[:name]} kicked #{target[:name]}'s face in for 💢 #{damage_dealt} damage! What a savage!",
    "A brutal hit! #{attacker[:name]} lays #{target[:name]} out, delivering 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} smashed #{target[:name]} for 💢 #{damage_dealt} damage! Better think fast!",
    "#{attacker[:name]} trounced #{target[:name]} for 💢 #{damage_dealt} damage! Step on up brah!",
    "#{attacker[:name]} slammed #{target[:name]} for 💢 #{damage_dealt} damage! Nice shot bro!",
    "#{attacker[:name]} merked #{target[:name]} for 💢 #{damage_dealt} damage! What's up!",
    "#{attacker[:name]} weighed #{target[:name]} in for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} sorted #{target[:name]} out for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} mashed #{target[:name]} up for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} wrecked #{target[:name]} for 💢 #{damage_dealt} damage!",
    "#{attacker[:name]} did #{target[:name]} in for 💢 #{damage_dealt} damage!",
  ]

  puts text_break(messages.sample, " ", 70)
end

# Sommersault attack

def somersault(chance, enemy)
  success = [
    "You turned Super Saiyan 😼, the scouter 🥽 says your power level is over 9000 ‼",
    "You ran up the wall and did a sick backflip, you strike #{enemy[:name]} twice!",
    "⬇ ↘ ➡ HP LP ⬅ ↖ ⬆ LP ⬆ ↖ ⬅ HK  ⬇ LK HP  ⬇ ↘ ➡ ➡ ⬆ ⬇ HK :: Ultra Combo...",
    "With outcomes like these 💯 you might win after all, roll 🎲 twice!",
    "The gods ⚖ smile upon you, your path is righteous",
    "Bang on ⚖. You get 2 attacks!",
  ]
  failed = [
    "You stacked 😵 it! #{enemy[:name]} is gonna have a field day, you plum!",
    "You shouldn't have eaten 3 pizzas 🍕 before trying to do acrobatics 🤢.",
    "You tripped over your own shoelaces 👞 and knocked yourself out 😵.",
    "You're still pretty wasted 🍻, you can't even stand straight.",
    "It ain't gonna happen today mate 🚷, take bare damage bruv",
    "#{enemy[:name]} laughed 😂 and socked 👊 you in the face.",
    "You thought you had it, but you got merked instead 😭",
  ]

  messages = chance == 1 ? success : failed
  puts text_break(messages.sample, " ", 70)
end

# Explore rooms > player randomly attacked

def random_attack(enemy)
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

  puts text_break(messages.sample, " ", 70)
end

# Enemy killed

def enemy_killed(enemy)
  messages = [
    "#{enemy[:name]} took the 🚂 midnight train to slab city.",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} turned into a ghost, whooo 👻",
    "#{enemy[:name]} took a trip ✈️ to Belize.",
    "#{enemy[:name]} died. 🎯 Bully for you!",
    "#{enemy[:name]}: 'Argh, yar got me!'",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} was defeated ☠",
    "#{enemy[:name]} got shanked 🗡",
    "#{enemy[:name]} got got 💀",
    "You knocked #{enemy[:name]}'s head clean off.",
    "You blasted #{enemy[:name]}! Flawless 💎 Victory.",
  ]

  puts SEPARATOR
  puts text_break(messages.sample, " ", 70)
end
