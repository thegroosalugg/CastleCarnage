# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def run_away(enemy)
  run_msgs = [
    "Fuck, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
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
    "Damn I need a slash so bad! Fuck it, #{selected_room[:name]} will do.",
  ]

  puts room_msg.sample
end

def gained_health(randomizer)
  gained_msg = [
    "Holy shit! A fucking cake 🎂! Munched! You gained 💗 #{randomizer} HP!",
    "Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained 💗 #{randomizer} HP!",
    "Proper hungry. These mouldy bananas 🍌 will have to do. You gained 💗 #{randomizer} HP!",
    "Fuckin' A🅰! Still some cold ones in the fridge 🍻! You gained 💗 #{randomizer} HP!",
    "Ah mate! Who left this grass ☘ here?! Northern Lights? Sweet! You gained 💗 #{randomizer} HP!",
    "There's some chips 🍟 on the floor. 5 second rule ‼ You gained 💗 #{randomizer} HP!",
    "This milk 🍼 is horribly out of date, but its not like there's a sodding restaurant around! You gained 💗 #{randomizer} HP!",
    "Heisenberg's blue 🕵️‍♂️!! Whoa! 🥴 River dance! You gained 💗 #{randomizer} HP!",
  ]

  puts gained_msg.sample
end

def lost_health(randomizer)
  lost_msg = [
    "Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost 🖤 #{randomizer} HP!",
    "KABLAMO ‼ 💥 Fucking landmines 🕳 ! Who the fuck put these here?! You lost 🖤 #{randomizer} HP!",
    "As you walked in a fridge 🧳 fell on you. You lost 🖤 #{randomizer} HP!",
    "An axe 🪓 flew across the room and hit you in the face! You lost 🖤 #{randomizer} HP!",
    "You stepped on a rake 🏒 ! You lost 🖤 #{randomizer} HP!",
    "You got a beer 🍺! But it was one beer too many. Lose 🖤 #{randomizer} HP!",
  ]

  puts lost_msg.sample
end

def enemy_health(randomizer, enemy)
  enemy_health_msg = [
    "Bad decision. #{enemy[:name]} found enlightenment. #{enemy[:name]} gained 🤍 #{randomizer} HP",
    "Your cowardice allowed #{enemy[:name]} to recover 🤍 #{randomizer} HP",
  ]

  puts enemy_health_msg.sample
end

def enemy_trap(randomizer, enemy)
  enemy_trap_msg = [
    "Booya 💥, the #{enemy[:name]} stepped on a land mine 🕳 ! #{enemy[:name]} lost 💢 #{randomizer} HP",
    "Chasing after you, #{enemy[:name]} walked in front of a truck 🚚. #{enemy[:name]} lost 💢 #{randomizer} HP",
  ]

  puts enemy_trap_msg.sample
end

def got_weapon(weapon)
  weapon_msg = [
    "Gift! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!",
    "Mysterious Stranger 🕵️‍♂️ appeared, 'Hey kid, catch', he throws you a #{weapon[:name]}",
  ]

  puts weapon_msg.sample
end

def enemy_spawn(enemy)
  spawn_msg = [
    "Oh fuck! You just dun goofed, #{enemy[:name]} jumped out at you!",
    "Motherfucker, #{enemy[:name]} sprung out the fridge, he coming right for ya!",
  ]

  puts spawn_msg.sample
end

def empty_room
  empty_msg = [
    "🐩🐕🐩 nothing but dogs barking in here, time to vamoose",
    "You have an ominous feeling somebody 🦇 was just here 🔲.",
  ]

  puts empty_msg.sample
end
