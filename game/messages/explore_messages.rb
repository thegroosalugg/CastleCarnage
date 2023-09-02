# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def run_away(enemy)
  run_msgs = [
    "Fuck, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "Damn, that #{enemy[:name]}'s a bitch, maybe there be something in one of them rooms.",
    "Blimey, it's a proper pickle! #{enemy[:name]} is right on me tail!",
    "I'm knackered, need a breather. That #{enemy[:name]} is a right menace!",
    "Watch out for that bobby! #{enemy[:name]} is after me!",
    "This place is a right madhouse! #{enemy[:name]} is chasing me like a nutter!",
    "I'm absolutely gobsmacked. #{enemy[:name]} nearly had me!",
    "Tossers like #{enemy[:name]} don't scare me! I'm making a run for it!",
    "Cor blimey! #{enemy[:name]} is hot on me heels! Time to scarper!",
    "I'm outta here, leaving #{enemy[:name]} in the lurch!",
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
    "I think I smelled some nosh 🍔 in #{selected_room[:name]}, better check it, absolutely famished.",
    "They won't find me in #{selected_room[:name]}, I'm golden 🥇!",
    "Bollocks! I need a slash so bad! Bugger it, #{selected_room[:name]} will have to do.",
    "In we go to #{selected_room[:name]}, let's 'ave it!",
    "Off to #{selected_room[:name]} I go, fingers crossed for good swag!",
    "#{selected_room[:name]} seems like the most blinding choice, innit?",
    "I've got a good feeling about #{selected_room[:name]}, let's 'ave a butcher's!",
    "#{selected_room[:name]} seems like the right place to be, mate!",
    "Oi, this #{selected_room[:name]} looks like a proper gaff, doesn't it?",
    "I reckon #{selected_room[:name]} might 'ave a hidden treasure or two!",
  ]

  puts room_msg.sample
end

def gained_health(randomizer)
  gained_msg = [
    "Holy shit! A fucking cake 🎂! Munched! You gained 💗 #{randomizer} HP!",
    "Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained 💗 #{randomizer} HP!",
    "Proper hungry. These mouldy bananas 🍌 will have to do. You gained 💗 #{randomizer} HP!",
    "Fuckin' A🅰! Still some cold ones in the fridge 🍻! You gained 💗 #{randomizer} HP!",
    "Ah mate! Who left this grass ☘ here?! Northern Lights? Sweet as! You gained 💗 #{randomizer} HP!",
    "There's some chips 🍟 on the floor. 5 second rule ‼ You gained 💗 #{randomizer} HP!",
    "This milk 🍼 is well out of date, eh, let's drink it anyways. You gained 💗 #{randomizer} HP!",
    "Heisenberg's blue 🕵️‍♂️!! Whoooa! 🥴 River dance! You gained 💗 #{randomizer} HP!",
    "Ransacked the pantry, whipped up some beans on toast 🍞 🥫, gained 💗 #{randomizer} HP!",
    "These chili peppers 🌶 should give me the quick energy I need! You gained 💗 #{randomizer} HP!",
    "What muppet left this pie 🥧 here, nicked. You gained 💗 #{randomizer} HP!",
    "A Spghetti Store 🏪 ? Here? Yeah I'll have the spaghetti 🍝. You gained 💗 #{randomizer} HP!",
  ]

  puts gained_msg.sample
end

def lost_health(randomizer)
  lost_msg = [
    "Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost 🖤 #{randomizer} HP!",
    "KABLAMO ‼ 💥 Fucking landmines 🕳 ! Who put these here?! You lost 🖤 #{randomizer} HP!",
    "As you walked in a fridge 🧳 fell on you. You lost 🖤 #{randomizer} HP!",
    "An axe 🪓 flew across the room and hit you in the face! You lost 🖤 #{randomizer} HP!",
    "You stepped on a rake 🏒 ! You lost 🖤 #{randomizer} HP!",
    "You got a beer 🍺! But it was one beer too many. Lose 🖤 #{randomizer} HP!",
    "Crikey! A seagull 🦆 swooped down and nicked your chips 🍟! You lost 🖤 #{randomizer} HP!",
    "The bad music 🎵 in this room torments you. You lost 🖤 #{randomizer} HP!",
    "You have no phone 📱 reception in this room. You lost 🖤 #{randomizer} HP!",
  ]

  puts lost_msg.sample
end

def enemy_health(randomizer, enemy)
  enemy_health_msg = [
    "Bad decision. #{enemy[:name]} found enlightenment. #{enemy[:name]} gained 🤍 #{randomizer} HP",
    "Your cowardice allowed #{enemy[:name]} to recover 🤍 #{randomizer} HP",
    "You're practically feeding #{enemy[:name]} with your poor decisions. They regain 🤍 #{randomizer} HP!",
    "#{enemy[:name]} feasts on your incompetence, gaining 🤍 #{randomizer} HP!",
    "#{enemy[:name]} is having a grand time at your expense, healing 🤍 #{randomizer} HP!",
    "You're practically a health potion for #{enemy[:name]}. They regain 🤍 #{randomizer} HP!",
    "It's like you're working for #{enemy[:name]}'s well-being. They gain 🤍 #{randomizer} HP!",
    "You're a one-person support system for #{enemy[:name]}. They heal 🤍 #{randomizer} HP!",
    "#{enemy[:name]} finds your actions amusing, and they recover 🤍 #{randomizer} HP.",
    "Congratulations, you've become #{enemy[:name]}'s personal healer, restoring 🤍 #{randomizer} HP!",
    "#{enemy[:name]} thanks you for the health boost as they regain 🤍 #{randomizer} HP!",
    "Keep up the good work! #{enemy[:name]} is loving the free health recovery of 🤍 #{randomizer} HP!",
    "#{enemy[:name]} laughs at your missteps and eats up 🤍 #{randomizer} HP!",
  ]

  puts enemy_health_msg.sample
end

def enemy_trap(randomizer, enemy)
  enemy_trap_msg = [
    "Booya 💥, the #{enemy[:name]} stepped on a land mine 🕳 ! #{enemy[:name]} lost 💢 #{randomizer} HP",
    "Chasing after you, #{enemy[:name]} walked in front of a truck 🚚. #{enemy[:name]} lost 💢 #{randomizer} HP",
    "Your level of swagger is too high, #{enemy[:name]} just couldn't take and lost 💢 #{randomizer} HP",
    "",
  ]

  puts enemy_trap_msg.sample
end

def got_weapon(weapon)
  weapon_msg = [
    "Gift 🎁 ! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!",
    "Mysterious Stranger 🕵️‍♂️ appeared, 'Hey kid, catch', he throws you a #{weapon[:name]}",
    "No way, you just remembered you still have your #{weapon[:name]} in your sock 🧦 !",
    "You reach into your pocket for a cigarette 🚬 and pull out a #{weapon[:name]}. Jackpot!",
    "Rummaging through the fridge 🧊, you find a #{weapon[:name]} sandwiched between the pickles! Time to add some flavour to this thrashing!",
    "Your Amazon ⬜ package has arrived, it's that #{weapon[:name]} you ordered. Time for beatdown!",
    "There's enough useless crap 🛒 here to manfacture a #{weapon[:name]}, your mad smithing skills allow it.",
    "Santa Claus 🎅 came to bring you your gift early, it's that #{weapon[:name]} you wished for",
    "A genie 🧞 appears and grants you 3 wishes, but you're only gonna need one, a #{weapon[:name]} for laying down the law.",
    "What's this? 🤔 You find a hidden #{weapon[:name]} in the back of a dusty closet. Time to rewrite history!",
    "While checking the drawers 🗄️, you found a #{weapon[:name]} hidden among the spoons!",
    "Under the bed 🛏️, you discovered a #{weapon[:name]} 👀. Time for some pummeling!",
    "You open a cookbook 📙, hollowed out there's a #{weapon[:name]} inside, you check your watch ⌚, it's 5 past throwdown o'clock.",
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
