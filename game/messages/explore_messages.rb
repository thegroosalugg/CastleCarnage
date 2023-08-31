# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def run_away(enemy)
  run_msgs = [
    "Fuck, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta peg it!",
    "Fuck that #{enemy[:name]}'s a bitch, maybe there be something in one of them rooms.",
  ]

  puts run_msgs.sample
  puts "----------------------------------------------------------------------"
end

def enter_room(selected_room)
  room_msg = [
    "You bolted off to #{selected_room[:name]}",
    "You danced 🕺 into #{selected_room[:name]}",
    "You ran and did a mental action dive 🦶 into #{selected_room[:name]}",
    "#{selected_room[:name]} seems like most inticing choice.",
    "I think I smelled some grub 🥗 in #{selected_room[:name]}, better check it, fuckin' stavin'.",
    "They won't find me in #{selected_room[:name]}, I'm golden 🥇!",
    "Damn I need a shit so bad! Fuck it, #{selected_room[:name]} will do.",
    "#{selected_room[:name]} is a perfect place to take a slash",
  ]

  puts room_msg.sample
end

def gained_health(randomizer)
  gained_msg = [
    "Holy shit! A fucking cake 🎂! Munched! You gained ❤ #{randomizer} HP!",
    "Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained ❤ #{randomizer} HP!",
    "Proper hungry. These mouldy bananas 🍌 will have to do. You gained ❤ #{randomizer} HP!",
    "Fuckin' 🅰! Still some cold ones in the fridge 🍻! You gained ❤ #{randomizer} HP!",
    "Ah mate! Who left this grass ☘ here?! Northern Lights? Sweet! You gained ❤ #{randomizer} HP!",
    "There's some chips 🍟 on the floor. 5 second rule ‼ You gained ❤ #{randomizer} HP!",
    "This milk 🍼 is horribly out of date, but its not like there's a sodding restaurant around! You gained ❤ #{randomizer} HP!",
    "Heisenberg's blue 🕵️‍♂️!! Whoa! 🥴 River dance! You gained ❤ #{randomizer} HP!",
  ]

  puts gained_msg.sample
end

def lost_health(randomizer)
  lost_msg = [
    "Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost 🤍 #{randomizer} HP!",
    "KABLAMO ‼ 💥 Fucking landmines 🕳 ! Who the fuck put these here?! You lost 🤍 #{randomizer} HP!",
    "As you walked in a fridge 🧳 fell on you. You lost 🤍 #{randomizer} HP!",
    "An axe 🪓 flew across the room and hit you in the face! You lost 🤍 #{randomizer} HP!",
    "You stepped on a rake 🏒 ! You lost 🤍 #{randomizer} HP!",
  ]

  puts lost_msg.sample
end
