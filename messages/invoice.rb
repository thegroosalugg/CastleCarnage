# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes

def invoice(player, amount, where)
  x, messages = case where                             # this condition simply sets a + symbol in fron of positive integers
  when :brawl then [100, "#{CASH} #{amount[0].positive? ? "+" : ""}#{amount[0]} 💵  #{HANGOVER} #{amount[1].positive? ? "+" : ""}#{amount[1]} 🍺"] # bar fight
  when :bar   then [100, "#{CASH} -#{amount} 💵  #{HANGOVER} +#{amount} 🍺"] # pay the tab
  when :guard then [100, "#{WEAPON} #{BONUS} +#{amount} 🛡️"] # not tonight
  when :cash  then [85, "#{CASH} +#{amount} 💵"] # sneak attack / blackjack
  when :loss  then [85, "#{CASH} -#{amount} 💵"] # xhardcorex / blackjack
  when :life  then [100, "#{BONUS} #{HP_PLUS} #{player[:name]} +#{amount} #{player[:emoji]}"] # sneak attack
  when :grave then [100, "#{HP_MINUS} #{player[:name]} -#{amount} #{player[:emoji]}"] # nectromancy
  when :cards then [110, "#{player[:name]} drew #{CARD} #{amount.last[:suit]}"] # blackjack
  end
  puts text_break(messages, " ", x)
end

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = "#{HP_PLUS} +#{health} #{player[:emoji]}  #{BUFF} +#{multiplier} #{boost}"

  puts text_break("#{BONUS}", " ", 80)
  puts text_break(messages, " ", 90)
end

# gift messages from exploring rooms

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
