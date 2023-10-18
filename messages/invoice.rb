# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes

def invoice(player, amount, where)
  x, messages = case where                             # this condition simply sets a + symbol in fron of positive integers
  when :bounty then [90, "#{BONUS} #{player[:name]} +10 #{player[:emoji]} + 1 💵"]
  when :cash  then  [85, "#{CASH} +#{amount} 💵"] # blackjack
  when :loss  then  [85, "#{CASH} -#{amount} 💵"] # blackjack
  when :cards then  [110, "#{player[:name]} drew #{CARD} #{amount.last[:suit]}"] # blackjack
  end
  puts text_break(messages, " ", x)
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
  when 0 then (entity[:id] == :player ? ITEM + gained_hp.sample : THIEF +   enemy_hp.sample) + plus
  when 1 then (entity[:id] == :player ? DEBT +   lost_hp.sample : TRAP  + enemy_trap.sample) + minus
  end
  puts text_break(messages, " ", 100)
end
