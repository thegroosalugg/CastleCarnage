# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enter_room(entered_room)
  messages = [
    "💭 Think I smelled some nosh 🍔 in #{entered_room[:name]}, better check that.",
    "💭 Got a good feeling about #{entered_room[:name]}, let's 'ave a butcher's!",
    "💭 Oi, this #{entered_room[:name]} looks like a proper gaff, doesn't it?",
    "💭 I reckon #{entered_room[:name]} might 'ave a hidden treasure or two!",
    "💭 Need a slash so bad! Bugger it, #{entered_room[:name]} will do.",
    "💭 They won't find me in #{entered_room[:name]}, I'm golden 🥇",
    "💭 #{entered_room[:name]} seems like most logical choice.",
    "💭 In we go to #{entered_room[:name]}, let's 'ave it!",
    "💭 #{entered_room[:name]} is the place to be, mate!",
  ]

  puts text_break(messages.sample, " ", 80)
end

def gifts(entity, operator, randomizer)
  w = "\e[32m𝙃𝙋\e[0m"
  l = "\e[31m𝙃𝙋\e[0m"
  ew = "\e[31m𝕰𝖓𝖊𝖒𝖞\e[0m"
  el = "\e[32m𝕰𝖓𝖊𝖒𝖞\e[0m"
  gained_hp = [
    "#{w} This milk 🍼 is well out of date, eh, let's drink it anyways #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} A Spaghetti Store? Here? Yeah, I'll have the spaghetti 🍝 #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Proper starvin'. These mouldy bananas 🍌 will have to do #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Fuckin' A! Still some cold ones in the fridge 🍻 #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} There's some chips 🍟 on the floor. 5 second rule! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Some muppet left a pizza 🍕 in the bin 🗑️ #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} The Rock 🪨 awaits and high fives 🙏 you #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Northern Lights 🌿 Sweet as! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Holy shit! A fucking cake 🎂 #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Heisenberg's 🕵️‍♂️ blue! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Chili Peppers 🌶️ Yum! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{w} Shrooms 🍄 #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
  ]
  lost_hp = [
    "#{l} An axe 🪓 flew across the room and hit you in the face! #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} There's a party 🎉 occuring, but you don't know anyone #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} You got a Take Away 🥡 but they got your order wrong #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} You walked into the bad part of the neighbourhood 🏘  #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} You got a beer 🍺 But it was one beer too many #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} A bear 🐻 jumped out and ate some of you #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} As you walked in a fridge 🧳 fell on you #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} The bad music 🎵 up in here torments you #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} Bollocks, you stepped in a bear trap 🐻 #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} KABLAMO! 💥 Bloody landmines 🕳 #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{l} The Wi-Fi 📱 disconnected #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
  ]
  enemy_hp = [
    "#{ew} There's bare food 🍕🥞🥟 here, #{entity[:name]} ate all of it! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{ew} #{entity[:name]} got to the fridge 🍶 before you! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{ew} Your cowardice allowed #{entity[:name]} to recover! #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{ew} #{entity[:name]} found enlightenment ⛪ #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
    "#{ew} 911 🚑 heals #{entity[:name]} +#{randomizer} #{entity[:emoji]}",
  ]
  enemy_trap = [
    "#{el} Booya 💥 #{entity[:name]} stepped on a land mine 🕳   #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{el} #{entity[:name]} walked in front of a truck 🚚 #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{el} Nobody suspects... the butterfly 🦋 #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
    "#{el} Elevator 🛗 fell on #{entity[:name]} -#{randomizer} #{entity[:emoji]}",
  ]

  messages = case operator
  when 0 then entity[:id] == :player ? gained_hp : enemy_hp
  when 1 then entity[:id] == :player ? lost_hp : enemy_trap
  end
  puts text_break(messages.sample, " ", 80)
end

def weapon_speaks(weapon, status)
  got = [
    "Rummaging through the fridge 🧊, you find a #{weapon[:name]} sandwiched between the pickles! Let's add some flavour to this thrashing!",
    "You open a cookbook 📙, hollowed out there's a #{weapon[:name]} inside. You check your watch ⌚, it's 5 past throwdown o'clock.",
    "A genie 🧞 appears and grants you 3 wishes, but you're only gonna need one: a #{weapon[:name]} for laying down the law.",
    "What's this? 🤔 You find a hidden #{weapon[:name]} in the back of a dusty closet. Time to rewrite history!",
    "There's enough useless crap 🛒 here to manfacture a #{weapon[:name]}, your mad smithing skills allow it.",
    "Your Amazon 🎁 package has arrived, it's that #{weapon[:name]} you ordered. Time for beatdown!",
    "Santa Claus 🎅 came to bring you your gift early, it's that #{weapon[:name]} you wished for",
    "You reach into your pocket for a cigarette 🚬 and pull out a #{weapon[:name]}. Jackpot!",
    "While checking the drawers 🗄️, you found a #{weapon[:name]} hidden among the spoons!",
    "Gift 🎁 ! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!",
    "Mysterious Stranger 🕵️‍♂️ appeared, 'Hey kid, catch', he throws you a #{weapon[:name]}",
    "No way, you just remembered you still have your #{weapon[:name]} in your sock 🧦",
    "Under the bed 🛏️, you discovered a #{weapon[:name]} 👀 Time for some pummeling!",
  ]
  broke = [
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
    "😲 Poxy #{weapon[:name]} gone 'n' did a runner on you",
    "😲 Your #{weapon[:name]} disappears into thin air",
    "😲 Goodbye #{weapon[:name]}, you will be missed.",
  ]
  messages = status == :got ? got : broke
  puts SEPARATOR if status == :broke
  puts text_break(messages.sample, " ", 80)
end
