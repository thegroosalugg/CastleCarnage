# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def run_away(enemy)
  run_msgs = [
    "Damn, that #{enemy[:name]}'s a wasteman, maybe there be something in one of them rooms.",
    "There's a rad motorbike 🏍 parked up, you gank it quick and mosey off.",
    "Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "Better leg it, not let #{enemy[:name]} get the drop on you.",
    "Time to get ghost 👻",
  ]

  puts run_msgs.sample
  puts SEPARATOR
end

def enter_room(selected_room)
  room_msg = [
    "I think I smelled some nosh 🍔 in #{selected_room[:name]}, better check it, absolutely famished.",
    "Bollocks! I need a slash so bad! Bugger it, #{selected_room[:name]} will have to do.",
    "I've got a good feeling about #{selected_room[:name]}, let's 'ave a butcher's!",
    "Oi, this #{selected_room[:name]} looks like a proper gaff, doesn't it?",
    "I reckon #{selected_room[:name]} might 'ave a hidden treasure or two!",
    "You ran and did a mental action dive 🦶 into #{selected_room[:name]}",
    "#{selected_room[:name]} seems like the most blinding choice, innit?",
    "Off to #{selected_room[:name]} I go, fingers crossed for good swag!",
    "#{selected_room[:name]} seems like the right place to be, mate!",
    "They won't find me in #{selected_room[:name]}, I'm golden 🥇",
    "#{selected_room[:name]} seems like most inticing choice.",
    "In we go to #{selected_room[:name]}, let's 'ave it!",
    "You danced 🕺 into #{selected_room[:name]}",
    "You bolted off to #{selected_room[:name]}",
  ]

  puts room_msg.sample
end

def gained_health(randomizer)
  gained_msg = [
    "Ah mate! Who left this grass ☘ here?! Northern Lights? Sweet as! You gained 💗 #{randomizer} HP!",
    "A Spghetti Store 🏪 ? Here? Yeah, I'll have the spaghetti 🍝. You gained 💗 #{randomizer} HP!",
    "These chili peppers 🌶 should give me the quick energy I need! You gained 💗 #{randomizer} HP!",
    "Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained 💗 #{randomizer} HP!",
    "This milk 🍼 is well out of date, eh, let's drink it anyways. You gained 💗 #{randomizer} HP!",
    "Ransacked the pantry, whipped up some beans on toast 🍞 🥫, gained 💗 #{randomizer} HP!",
    "Proper hungry. These mouldy bananas 🍌 will have to do. You gained 💗 #{randomizer} HP!",
    "The Rock 👨‍🦲 awaits you and gives you a high five 🙏. You gained 💗 #{randomizer} HP!",
    "Fuckin' A🅰! Still some cold ones in the fridge 🍻! You gained 💗 #{randomizer} HP!",
    "There's some chips 🍟 on the floor. 5 second rule ‼ You gained 💗 #{randomizer} HP!",
    "Heisenberg's blue 🕵️‍♂️!! Whoooa! 🥴 River dance! You gained 💗 #{randomizer} HP!",
    "What muppet left this pie 🥧 here, nicked. You gained 💗 #{randomizer} HP!",
    "Holy shit! A fucking cake 🎂! Munched! You gained 💗 #{randomizer} HP!",
    "You got the Wi-Fi Password 📝! You gained 💗 #{randomizer} HP!",
    "The doctor 🥼 is in the house. You gained 💗 #{randomizer} HP!",
    "Some shrooms 🍄, You gained 💗 #{randomizer} HP!",
  ]

  puts gained_msg.sample
end

def lost_health(randomizer)
  lost_msg = [
    "The phone 📱 reception in here is terrible and there's no Wi-Fi 📻. You lost 🖤 #{randomizer} HP!",
    "Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost 🖤 #{randomizer} HP!",
    "Crikey! A seagull 🦆 swooped down and nicked your chips 🍟! You lost 🖤 #{randomizer} HP!",
    "KABLAMO ‼ 💥 bloody landmines 🕳 ! Who put these here?! You lost 🖤 #{randomizer} HP!",
    "An axe 🪓 flew across the room and hit you in the face! You lost 🖤 #{randomizer} HP!",
    "There's a party 🎉 occuring, but you don't know anyone. You lost 🖤 #{randomizer} HP!",
    "You got a Take Away 🥡, but they got your order wrong. You lost 🖤 #{randomizer} HP!",
    "You walked into the bad part of the neighbourhood 🏘.  You lost 🖤 #{randomizer} HP!",
    "You got a beer 🍺! But it was one beer too many. You lost 🖤 #{randomizer} HP!",
    "A bear 🐻 jumped out and ate some of you. You lost 🖤 #{randomizer} HP!",
    "As you walked in a fridge 🧳 fell on you. You lost 🖤 #{randomizer} HP!",
    "The bad music 🎵 up in here torments you. You lost 🖤 #{randomizer} HP!",
    "You stepped on a rake 🏒 ! You lost 🖤 #{randomizer} HP!",
  ]

  puts lost_msg.sample
end

def enemy_health(randomizer, enemy)
  enemy_health_msg = [
    "You're practically feeding #{enemy[:name]} with your poor decisions. They regain 🤍 #{randomizer} HP!",
    "Congratulations, you've become #{enemy[:name]}'s personal healer, dishing out 🤍 #{randomizer} HP!",
    "Keep up the good work! #{enemy[:name]} is loving the free health recovery of 🤍 #{randomizer} HP!",
    "It's like you're working for #{enemy[:name]}'s well-being. They polished off 🤍 #{randomizer} HP!",
    "Bad decision. #{enemy[:name]} found enlightenment. #{enemy[:name]} gained 🤍 #{randomizer} HP",
    "You're practically a health potion for #{enemy[:name]}. They gorged 🤍 #{randomizer} HP!",
    "You're a one-person support system for #{enemy[:name]}. They scoff 🤍 #{randomizer} HP!",
    "#{enemy[:name]} is having a grand time at your expense, devouring 🤍 #{randomizer} HP!",
    "#{enemy[:name]} finds your actions amusing, as they chow down 🤍 #{randomizer} HP.",
    "#{enemy[:name]} thanks you for the health boost as they munch 🤍 #{randomizer} HP!",
    "#{enemy[:name]} feasts on your incompetence, wolfing down 🤍 #{randomizer} HP!",
    "#{enemy[:name]} laughs at your missteps and eats up 🤍 #{randomizer} HP!",
    "Your cowardice allowed #{enemy[:name]} to recover 🤍 #{randomizer} HP",
  ]

  puts enemy_health_msg.sample
end

def enemy_trap(randomizer, enemy)
  enemy_trap_msg = [
    "As you step inside you turn around and give a #{enemy[:name]} menacing glare dealing 💢 #{randomizer} damage, you feel dangerous ⚠",
    "Chasing after you, #{enemy[:name]} walked in front of a truck 🚚. #{enemy[:name]} lost 💢 #{randomizer} HP!",
    "Your level of swagger 😎 is too high, #{enemy[:name]} just couldn't take and lost 💢 #{randomizer} HP!",
    "You found a grenade 🍈, tossing it at #{enemy[:name]} for 💢 #{randomizer} damage! Kamblamo 💥",
    "Booya 💥, the #{enemy[:name]} stepped on a land mine 🕳  dealing 'em 💢 #{randomizer} damage!",
    "#{enemy[:name]} got weighed in on the way in, losing 💢 #{randomizer} HP!",
  ]

  puts enemy_trap_msg.sample
end

def got_weapon(weapon)
  weapon_msg = [
    "What's this? 🤔 You find a hidden #{weapon[:name]} in the back of a dusty closet. Time to rewrite history!",
    "There's enough useless crap 🛒 here to manfacture a #{weapon[:name]}, your mad smithing skills allow it.",
    "Your Amazon 🎁 package has arrived, it's that #{weapon[:name]} you ordered. Time for beatdown!",
    "Santa Claus 🎅 came to bring you your gift early, it's that #{weapon[:name]} you wished for",
    "You reach into your pocket for a cigarette 🚬 and pull out a #{weapon[:name]}. Jackpot!",
    "While checking the drawers 🗄️, you found a #{weapon[:name]} hidden among the spoons!",
    "Gift 🎁 ! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!",
    "Mysterious Stranger 🕵️‍♂️ appeared, 'Hey kid, catch', he throws you a #{weapon[:name]}",
    "No way, you just remembered you still have your #{weapon[:name]} in your sock 🧦 !",
    "Under the bed 🛏️, you discovered a #{weapon[:name]} 👀. Time for some pummeling!",

    "Rummaging through the fridge 🧊, you find a #{weapon[:name]} sandwiched between the pickles!
    Let's add some flavour to this thrashing!",

    "A genie 🧞 appears and grants you 3 wishes, but you're only gonna need one:
    a #{weapon[:name]} for laying down the law.",

    "You open a cookbook 📙, hollowed out there's a #{weapon[:name]} inside.
    You check your watch ⌚, it's 5 past throwdown o'clock.",
  ]

  puts weapon_msg.sample
end

def enemy_spawn(enemy)
  spawn_msg = [
    "There's another package from Amazon 🎁, but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    "You stare at the mirror 🔲, but you slowly realise the #{enemy[:name]} staring back isn't you...",
    "#{enemy[:name]} was waiting for you in the trash can 🚮, ready to show you he can thrash 👊",
    "Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    "The phone 📞 rings, you pick up, it's #{enemy[:name]} calling for your death.",
    "Wild #{enemy[:name]} appeared ‼ #{enemy[:name]}'s exerting its pressure!",
    "#{enemy[:name]}: 'Yargh, yer stepped into the wrong castle matey'",
    "Oh shit! You just dun goofed, #{enemy[:name]} jumped out at you!",
    "#{enemy[:name]}: 'Step on up kiddies, thrashings for all!'",
    "It's a full moon 🌕 tonight. #{enemy[:name]} steps on up.",
  ]

  puts spawn_msg.sample
end

def empty_room
  empty_msg = [
    "There's a Take Away Food Cart 🛍, but they only serve food you don't like, also you have no money 💵",
    "There are bikes 🚲🚲🚲 here but you can't ride indoors, Professor Oak 👨‍🏫 will find out immediately",
    "If you stay here, you'll have to help somebody pack 🧳, and it would probably take all day.",
    "The temperature 🔅 is just right, but there's something else you don't like here ⁉ 😠🗯 ⁉",
    "Nothing bad happened, nothing good happened either, you get another turn at life.",
    "There's the exit 🚪! But your foot 🦶 hurts so you can't leave.",
    "There's an elephant 🐘 in here. You marvell at its excellence.",
    "🐩🐕🐩 nothing but dogs barking in here, time to vamoose.",
    "You have an ominous feeling somebody 🦇 was just here 🔲",
    "Wild Entei 🐕‍🦺 appeared! Entei 🐕‍🦺 fled 💨.",
    "It's too bloody hot ♨ in here 🥵",
    "Freezing ❄ my ass off here 🥶",
  ]

  puts empty_msg.sample
end
