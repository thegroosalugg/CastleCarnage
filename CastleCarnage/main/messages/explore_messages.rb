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

  puts text_break(run_msgs.sample, " ", 70)
end

def enter_room(entered_room)
  room_msg = [
    "I think I smelled some nosh 🍔 in #{entered_room[:name]}, better check it, absolutely famished.",
    "Bollocks! I need a slash so bad! Bugger it, #{entered_room[:name]} will have to do.",
    "I've got a good feeling about #{entered_room[:name]}, let's 'ave a butcher's!",
    "Oi, this #{entered_room[:name]} looks like a proper gaff, doesn't it?",
    "I reckon #{entered_room[:name]} might 'ave a hidden treasure or two!",
    "You ran and did a mental action dive 🦶 into #{entered_room[:name]}",
    "#{entered_room[:name]} seems like the most blinding choice, innit?",
    "Off to #{entered_room[:name]} I go, fingers crossed for good swag!",
    "#{entered_room[:name]} seems like the right place to be, mate!",
    "They won't find me in #{entered_room[:name]}, I'm golden 🥇",
    "#{entered_room[:name]} seems like most inticing choice.",
    "In we go to #{entered_room[:name]}, let's 'ave it!",
    "You danced 🕺 into #{entered_room[:name]}",
    "You bolted off to #{entered_room[:name]}",
  ]

  puts text_break(room_msg.sample, " ", 70)
end

def gifted(gift, randomizer, player, enemy, weapon)
  gained_hp = [
    "Ah mate! Who left this grass ☘ here?! Northern Lights? Sweet as! You gained #{player[:emoji]} #{randomizer} HP!",
    "A Spghetti Store 🏪 ? Here? Yeah, I'll have the spaghetti 🍝. You gained #{player[:emoji]} #{randomizer} HP!",
    "These chili peppers 🌶 should give me the quick energy I need! You gained #{player[:emoji]} #{randomizer} HP!",
    "Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained #{player[:emoji]} #{randomizer} HP!",
    "This milk 🍼 is well out of date, eh, let's drink it anyways. You gained #{player[:emoji]} #{randomizer} HP!",
    "Ransacked the pantry, whipped up some beans on toast 🍞 🥫, gained #{player[:emoji]} #{randomizer} HP!",
    "Proper hungry. These mouldy bananas 🍌 will have to do. You gained #{player[:emoji]} #{randomizer} HP!",
    "The Rock 👨‍🦲 awaits you and gives you a high five 🙏. You gained #{player[:emoji]} #{randomizer} HP!",
    "Fuckin' A🅰! Still some cold ones in the fridge 🍻! You gained #{player[:emoji]} #{randomizer} HP!",
    "There's some chips 🍟 on the floor. 5 second rule ‼ You gained #{player[:emoji]} #{randomizer} HP!",
    "Heisenberg's blue 🕵️‍♂️!! Whoooa! 🥴 River dance! You gained #{player[:emoji]} #{randomizer} HP!",
    "What muppet left this pie 🥧 here, nicked. You gained #{player[:emoji]} #{randomizer} HP!",
    "Holy shit! A fucking cake 🎂! Munched! You gained #{player[:emoji]} #{randomizer} HP!",
    "You got the Wi-Fi Password 📝! You gained #{player[:emoji]} #{randomizer} HP!",
    "The doctor 🥼 is in the house. You gained #{player[:emoji]} #{randomizer} HP!",
    "Some shrooms 🍄, You gained #{player[:emoji]} #{randomizer} HP!",
  ]
  lost_hp = [
    "The phone 📱 reception in here is terrible and there's no Wi-Fi 📻. You lost #{player[:emoji]} #{randomizer} HP!",
    "Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost #{player[:emoji]} #{randomizer} HP!",
    "Crikey! A seagull 🦆 swooped down and nicked your chips 🍟! You lost #{player[:emoji]} #{randomizer} HP!",
    "KABLAMO ‼ 💥 bloody landmines 🕳 ! Who put these here?! You lost #{player[:emoji]} #{randomizer} HP!",
    "An axe 🪓 flew across the room and hit you in the face! You lost #{player[:emoji]} #{randomizer} HP!",
    "There's a party 🎉 occuring, but you don't know anyone. You lost #{player[:emoji]} #{randomizer} HP!",
    "You got a Take Away 🥡, but they got your order wrong. You lost #{player[:emoji]} #{randomizer} HP!",
    "You walked into the bad part of the neighbourhood 🏘.  You lost #{player[:emoji]} #{randomizer} HP!",
    "You got a beer 🍺! But it was one beer too many. You lost #{player[:emoji]} #{randomizer} HP!",
    "A bear 🐻 jumped out and ate some of you. You lost #{player[:emoji]} #{randomizer} HP!",
    "As you walked in a fridge 🧳 fell on you. You lost #{player[:emoji]} #{randomizer} HP!",
    "The bad music 🎵 up in here torments you. You lost #{player[:emoji]} #{randomizer} HP!",
    "You stepped on a rake 🏒 ! You lost #{player[:emoji]} #{randomizer} HP!",
  ]
  enemy_hp = [
    "You're practically feeding #{enemy[:name]} with your poor decisions. They regain #{enemy[:emoji]} #{randomizer} HP!",
    "Congratulations, you've become #{enemy[:name]}'s personal healer, dishing out #{enemy[:emoji]} #{randomizer} HP!",
    "Keep up the good work! #{enemy[:name]} is loving the free health recovery of #{enemy[:emoji]} #{randomizer} HP!",
    "It's like you're working for #{enemy[:name]}'s well-being. They polished off #{enemy[:emoji]} #{randomizer} HP!",
    "Bad decision. #{enemy[:name]} found enlightenment. #{enemy[:name]} gained #{enemy[:emoji]} #{randomizer} HP",
    "You're practically a health potion for #{enemy[:name]}. They gorged #{enemy[:emoji]} #{randomizer} HP!",
    "You're a one-person support system for #{enemy[:name]}. They scoff #{enemy[:emoji]} #{randomizer} HP!",
    "#{enemy[:name]} is having a grand time at your expense, devouring #{enemy[:emoji]} #{randomizer} HP!",
    "#{enemy[:name]} finds your actions amusing, as they chow down #{enemy[:emoji]} #{randomizer} HP.",
    "#{enemy[:name]} thanks you for the health boost as they munch #{enemy[:emoji]} #{randomizer} HP!",
    "#{enemy[:name]} feasts on your incompetence, wolfing down #{enemy[:emoji]} #{randomizer} HP!",
    "#{enemy[:name]} laughs at your missteps and eats up #{enemy[:emoji]} #{randomizer} HP!",
    "Your cowardice allowed #{enemy[:name]} to recover #{enemy[:emoji]} #{randomizer} HP",
  ]
  enemy_trap = [
    "As you step inside you turn around and give a #{enemy[:name]} menacing glare dealing 💢 #{randomizer} damage, you feel dangerous ⚠",
    "Chasing after you, #{enemy[:name]} walked in front of a truck 🚚. #{enemy[:name]} lost 💢 #{randomizer} HP!",
    "Your level of swagger 😎 is too high, #{enemy[:name]} just couldn't take and lost 💢 #{randomizer} HP!",
    "You found a grenade 🍈, tossing it at #{enemy[:name]} for 💢 #{randomizer} damage! Kamblamo 💥",
    "Booya 💥, the #{enemy[:name]} stepped on a land mine 🕳  dealing 'em 💢 #{randomizer} damage!",
    "#{enemy[:name]} got weighed in on the way in, losing 💢 #{randomizer} HP!",
  ]
  got_weapon = [
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
    "Rummaging through the fridge 🧊, you find a #{weapon[:name]} sandwiched between the pickles! Let's add some flavour to this thrashing!",
    "A genie 🧞 appears and grants you 3 wishes, but you're only gonna need one: a #{weapon[:name]} for laying down the law.",
    "You open a cookbook 📙, hollowed out there's a #{weapon[:name]} inside. You check your watch ⌚, it's 5 past throwdown o'clock.",
  ]
  enemy_spawn = [
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
  empty_room = [
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

    message = case gift
      when 1
        gained_hp
      when 2
        lost_hp
      when 3
        enemy_hp
      when 4
        enemy_trap
      when 5
        got_weapon
      when 6
        enemy_spawn
      when 7
        empty_room
      end
      puts text_break(message.sample, " ", 70)
  end
