# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enter_room(entered_room)
  messages = [
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

  puts text_break(messages.sample, " ", 80)
end

def gifts(entity, operator, randomizer)
  gained_hp = [
    "✅ Ah mate! Who left this grass 🌿 here?! Northern Lights? Sweet as! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ These chili peppers 🌶️ should give me the quick energy I need! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Ha! Some idiot left this pizza 🍕 in the trash! What a treat! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ This milk 🍼 is well out of date, eh, let's drink it anyways. You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ A Spaghetti Store? Here? Yeah, I'll have the spaghetti 🍝 You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Proper hungry. These mouldy bananas 🍌 will have to do. You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ The Rock 👨‍🦲 awaits you and gives you a high five 🙏. You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Fuckin' A! Still some cold ones in the fridge 🍻! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ There's some chips 🍟 on the floor. 5 second rule‼ You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Heisenberg's 🕵️‍♂️ blue! Whoooa! 🥴 River dance! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ What muppet left this pie 🥧 here, nicked. You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Holy shit! A fucking cake 🎂! Munched! You gained #{entity[:emoji]} #{randomizer} HP!",
    "✅ Some shrooms 🍄, You gained #{entity[:emoji]} #{randomizer} HP!",
  ]
  lost_hp = [
    "❌ The phone 📱 reception in here is terrible and there's no Wi-Fi 📻. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ Bollocks, you stepped into a bear trap 🐻, this is gonna cost ya! You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ KABLAMO ‼ 💥 bloody landmines 🕳 ! Who put these here?! You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ An axe 🪓 flew across the room and hit you in the face! You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ There's a party 🎉 occuring, but you don't know anyone. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ You got a Take Away 🥡, but they got your order wrong. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ You walked into the bad part of the neighbourhood 🏘.  You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ You got a beer 🍺! But it was one beer too many. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ A bear 🐻 jumped out and ate some of you. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ As you walked in a fridge 🧳 fell on you. You lost #{entity[:emoji]} #{randomizer} HP!",
    "❌ The bad music 🎵 up in here torments you. You lost #{entity[:emoji]} #{randomizer} HP!",
  ]
  enemy_hp = [
    "❌ You're practically feeding #{entity[:name]} with your poor decisions. They regain #{entity[:emoji]} #{randomizer} HP!",
    "❌ 911 🚑 arrives and treats #{entity[:name]} for #{entity[:emoji]} #{randomizer} HP! Their prognosis is looking good.",
    "❌ It's like you're working for #{entity[:name]}'s well-being. They polished off #{entity[:emoji]} #{randomizer} HP!",
    "❌ Bad decision. #{entity[:name]} found enlightenment. #{entity[:name]} gained #{entity[:emoji]} #{randomizer} HP",
    "❌ There's bare food 🍕🥞🥟 here, #{entity[:name]} ate all of it chowing down #{entity[:emoji]} #{randomizer} HP.",
    "❌ #{entity[:name]} got to the fridge 🍶 before you, wolfing down #{entity[:emoji]} #{randomizer} HP!",
    "❌ #{entity[:name]} laughs at your missteps and eats up #{entity[:emoji]} #{randomizer} HP!",
    "❌ Your cowardice allowed #{entity[:name]} to recover #{entity[:emoji]} #{randomizer} HP",
  ]
  enemy_trap = [
    "✅ Chasing after you, #{entity[:name]} walked in front of a truck 🚚. #{entity[:name]} lost #{entity[:emoji]} #{randomizer} HP!",
    "✅ Your level of swagger 😎 is too high, #{entity[:name]} just couldn't take it and lost #{entity[:emoji]} #{randomizer} HP!",
    "✅ #{entity[:name]} just remembered they forgot to take the bins 🗑️ out costing them #{entity[:emoji]} #{randomizer} HP!",
    "✅ You found a grenade 🍈, tossing it at #{entity[:name]} for #{entity[:emoji]} #{randomizer} damage! Kamblamo 💥",
    "✅ Booya 💥, the #{entity[:name]} stepped on a land mine 🕳  dealing 'em #{entity[:emoji]} #{randomizer} damage!",
    "✅ Nobody suspects... the butterfly 🦋 ! #{entity[:name]} got merked for #{entity[:emoji]} #{randomizer} damage!",
    "✅ You got saved by Batman 🦇 !#{entity[:name]} going to prison 🏛️ for #{entity[:emoji]} #{randomizer} HP!",
    "✅ #{entity[:name]} got weighed in on the way in, losing #{entity[:emoji]} #{randomizer} HP!",
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
