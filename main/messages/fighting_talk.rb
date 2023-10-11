# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(attacker, target, damage = 0, outcome)
  critical = [
    "Get ready for a battering, #{attacker[:name]} is gone do #{target[:name]} in for 💥 #{damage} critical damage, #{target[:name]} is proper gutted bruv!",
    "Oh Shit! #{attacker[:name]} mashed #{target[:name]} up for #{damage} 💥 critical damage! #{target[:name]} looks like mashed potatoes mate!",
    "#{attacker[:name]}: ⬇ ⬆ LP ⬅ ⬅ ⬆ ⬇ LK HP ⬇ ↘ ➡ HP HK LP  ⬅ ↙ ⬇ ⬅  ↙ ⬇ :: 💥 #{damage} critical damage served to #{target[:name]}!",
    "#{attacker[:name]} did a mad front flip and volunteered #{target[:name]} to kiss the floor cleaning up 💥 #{damage} critical damage!",
    "#{attacker[:name]}'s deadlift 🏋️‍♂️ regime has been righteous. The 💥 #{damage} damage served to #{target[:name]} is a bit critical.",
    "#{attacker[:name]} did a running jump and kicked #{target[:name]} in their stupid face for 💥 #{damage} critical damage.",
    "#{attacker[:name]} is just better than #{target[:name]}, they merk #{target[:name]} for 💥 #{damage} critical damage.",
    "#{attacker[:name]} triple corked and double battered #{target[:name]} in the face for 💥 #{damage} critical damage!",
    "#{attacker[:name]} turns up the punishment as #{target[:name]} gets weighed in for 💥 #{damage} critical damage!",
    "#{attacker[:name]} did a sick combo on you for 💥 #{damage} critical damage, fucking #{target[:name]} up!",
    "#{attacker[:name]} lit on fire 🔥 dishing out #{target[:name]} a meal of 💥 #{damage} critical damage!",
    "#{attacker[:name]} did a crazy as flip and kicked #{target[:name]} for 💥 #{damage} critical damage",
    "Critical‼ #{attacker[:name]} smashed #{target[:name]} for 💥 #{damage} damage! Booya!",
  ]
missed = [
    "As #{attacker[:name]} swings, they miss and #{target[:name]} layed them flat out 😵. #{attacker[:name]} kissed the floor. #{attacker[:name]} is married to the floor.",
    "While charging #{target[:name]}, #{attacker[:name]} wanked it up and fell on their face 😣, dealing absolutely no damage. What a wally!",
    "#{attacker[:name]}'s stealth is like a brick 🧱 through a window. #{target[:name]} predicted the attack and calmly swayed out the way",
    "#{attacker[:name]} jumped at you and fell out the window, completely missing! #{attacker[:name]} had to climb back in!",
    "#{attacker[:name]} fired ♨ Mega Blast, #{target[:name]} dodged like a 😎 badman and tipped their fedora. No damage!",
    "#{attacker[:name]} fucked up. #{attacker[:name]} sips their zero soda and zero damage meal combo 🍔🍟🥤",
    "#{target[:name]} danced away 💃🏽 from #{attacker[:name]}'s attack, leaving them swinging at thin air!",
    "#{target[:name]} laughs at #{attacker[:name]}'s efforts. Their attacks go down like Skittles 🍬",
    "#{attacker[:name]} got confused and ran straight into a wall 😣, #{target[:name]} got lucky.",
    "#{target[:name]} jumped over 🦘 #{attacker[:name]}, avoiding them like an ex in a mall.",
    "#{target[:name]}'s stealth 👟 is spot on, they avoided #{attacker[:name]}'s mashing up!",
    "#{target[:name]} hid in an earn 🏺. #{attacker[:name]} couldn't find 'em.",
    "Its not #{attacker[:name]}'s day today, they clumsily run into a wall 🧱",
    "#{target[:name]} ✨ teleported and avoided #{attacker[:name]}'s attack.",
    "#{target[:name]} don't give a fuck, they mash #{attacker[:name]} up!",
    "#{target[:name]} 💬 '🚫 Denied‼'",
  ]
on_point = [
    "#{attacker[:name]} absolutely battered #{target[:name]} for 💢 #{damage} damage! #{target[:name]} got mashed up!",
    "School's in session. #{target[:name]} got teached by Professor 🧑‍🎓#{attacker[:name]} for 💢 #{damage} damage!",
    "#{attacker[:name]} slayed #{target[:name]} for 💢 #{damage} damage! #{target[:name]}'s getting merked!",
    "#{attacker[:name]} grabbed #{target[:name]} and smashed them through the wall for 💢 #{damage} damage!",
    "#{attacker[:name]} roughed #{target[:name]} up for 💢 #{damage} damage! Time to call for a doctor!",
    "#{attacker[:name]} absolutely wrecked #{target[:name]} for 💢 #{damage} damage! Who's the boss?!",
    "#{attacker[:name]} kicked #{target[:name]}'s face in for 💢 #{damage} damage! What a savage!",
    "A brutal hit! #{attacker[:name]} lays #{target[:name]} out, delivering 💢 #{damage} damage!",
    "#{attacker[:name]} smashed #{target[:name]} for 💢 #{damage} damage! Better think fast!",
    "#{attacker[:name]} trounced #{target[:name]} for 💢 #{damage} damage! Step on up brah!",
    "#{attacker[:name]} slammed #{target[:name]} for 💢 #{damage} damage! Nice shot bro!",
    "#{attacker[:name]} merked #{target[:name]} for 💢 #{damage} damage! What's up!",
    "#{attacker[:name]} weighed #{target[:name]} in for 💢 #{damage} damage!",
    "#{attacker[:name]} sorted #{target[:name]} out for 💢 #{damage} damage!",
    "#{attacker[:name]} mashed #{target[:name]} up for 💢 #{damage} damage!",
    "#{attacker[:name]} wrecked #{target[:name]} for 💢 #{damage} damage!",
    "#{attacker[:name]} did #{target[:name]} in for 💢 #{damage} damage!",
  ]
  counter = [
    "#{attacker[:name]} saw you try to pull a fast one and headbutted you for #{target[:emoji]} #{damage} damage.",
    "#{attacker[:name]} spotted you being a plank and served you for #{target[:emoji]} #{damage} damage.",
    ]

  messages = case outcome
  when :critical then critical
  when :missed   then missed
  when :hit      then on_point
  when :counter  then counter
  end
  puts text_break(messages.sample, " ", 70)
end

# Sommersault attack

def somersault(chance, enemy)
  success = [
    "You ran up the wall and did a sick backflip, you strike #{enemy[:name]} again and again!",
    "You turned Super Saiyan 😼, the scouter 🥽 says your power level is over 9000!",
    "⬇ ↘ ➡ HP LP ⬅ ↖ ⬆ LP ⬆ ↖ ⬅ HK  ⬇ LK HP  ⬇ ↘ ➡ ➡ ⬆ ⬇ HK ⟪⟪Ultra Combo⟫⟫",
    "With outcomes like these 💯 you might win after all, roll 🎲 on!",
    "The gods ⚖ smile upon you, your path is righteous",
    "Bang on ⚖. You get an extra attack or two!",
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
