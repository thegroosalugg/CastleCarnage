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
  plus = " #{entity[:name]} +#{randomizer} #{entity[:emoji]}"
  minus = " #{entity[:name]} -#{randomizer} #{entity[:emoji]}"

  gained_hp = [
    " This milk 🍼 is well out of date, eh, let's drink it anyways",
    " A Spaghetti Store? Here? Yeah, I'll have the spaghetti 🍝",
    " Proper starvin'. These mouldy bananas 🍌 will have to do",
    " Fuckin' A! Still some cold ones in the fridge 🍻",
    " There's some chips 🍟 on the floor. 5 second rule!",
    " Some muppet left a pizza 🍕 in the bin 🗑️",
    " The Rock 🪨 awaits and high fives 🙏 you",
    " Northern Lights 🌿 Sweet as!",
    " Holy shit! A fucking cake 🎂",
    " Heisenberg's 🕵️‍♂️ blue!",
    " Chili Peppers 🌶️ Yum!",
    " Shrooms 🍄",
  ]
  lost_hp = [
    " An axe 🪓 flew across the room and hit you in the face!",
    " There's a party 🎉 occuring, but you don't know anyone",
    " You got a Take Away 🥡 but they got your order wrong",
    " You walked into the bad part of the neighbourhood 🏘 ",
    " You got a beer 🍺 But it was one beer too many",
    " A bear 🐻 jumped out and ate some of you",
    " As you walked in a fridge 🧳 fell on you",
    " The bad music 🎵 up in here torments you",
    " Bollocks, you stepped in a bear trap 🐻",
    " KABLAMO! 💥 Bloody landmines 🕳",
    " The Wi-Fi 📱 disconnected",
  ]
  enemy_hp = [
    " There's bare food 🍕🥞🥟 here, #{entity[:name]} ate all of it!",
    " #{entity[:name]} got to the fridge 🍶 before you!",
    " Your cowardice allowed #{entity[:name]} to recover!",
    " #{entity[:name]} found enlightenment ⛪",
    " 911 🚑 heals",
  ]
  enemy_trap = [
    " Booya 💥 #{entity[:name]} stepped on a land mine 🕳",
    " #{entity[:name]} walked in front of a truck 🚚",
    " Nobody suspects... the butterfly 🦋",
    " Elevator 🛗 fell on",
  ]

  messages = case operator
  when 0 then (entity[:id] == :player ? HP_PLUS + gained_hp.sample : ENEMY_HP + enemy_hp.sample) + plus
  when 1 then (entity[:id] == :player ? HP_MINUS + lost_hp.sample : ENEMY_TRAP + enemy_trap.sample) + minus
  end
  puts text_break(messages, " ", 100)
end

def weapon_speaks(weapon, status)
  got = [
    " There's enough useless crap 🛒 here to make a #{weapon[:name]}, your mad smithing skills allow it",
    " Father Christmas 🎅 brings your gift early, it's that #{weapon[:name]} you wished for",
    " Gift! There's a #{weapon[:name]} here! Looks like the foot's on the other shoe!",
    " You reach into your pocket for a snout 🚬 and pull out a #{weapon[:name]}!",
    " You remembered you still have your #{weapon[:name]} in your sock 🧦",
    " 🕵🏼 Mysterious Stranger 💬 Hey kid, catch! #{weapon[:name]} acquired",
    " Package from Amazon 🎁 It's that #{weapon[:name]} you ordered!",
    " There's find a #{weapon[:name]} sandwiched between the pickles",
    " There's a #{weapon[:name]} inside this hollowed out book 📙",
    " A Djinn 🧞 grants you a wish, one #{weapon[:name]} please",
    " You found a #{weapon[:name]} hidden among the spoons!",
  ]
  broke = [
    " The universe conspires against you. Your #{weapon[:name]} melts!",
    " Your #{weapon[:name]} jumps ouuta your hand and runs off",
    " You suddenly forgot how to wield your #{weapon[:name]}",
    " Oh shit! Your #{weapon[:name]} broke. Better leg it!",
    " Poxy #{weapon[:name]} gon 'n' did a runner on you",
    " Your #{weapon[:name]} disappears into thin air",
    " Your #{weapon[:name]} flew out of the window!",
    " Goodbye #{weapon[:name]}, you will be missed",
    " Your #{weapon[:name]} resigned from service",
    " Damn it! You dropped your #{weapon[:name]}!",
    " Your #{weapon[:name]} was too shoddy",
  ]
  messages = status == :got ? (WEAPON + got.sample) : (BROKE + broke.sample)
  puts text_break(messages, " ", 100)
end
