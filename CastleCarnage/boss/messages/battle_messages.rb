# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def damage_info(the_boss, total_damage)
  dmg_messages = [
   "You smashed #{the_boss[:name]} in for like 💢 #{total_damage} damage, surfs up bro!",
   "Time for a mashing up, #{the_boss[:name]} got weighed in for 💢 #{total_damage} damage!",
  ]

  puts dmg_messages.sample
end

# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def got_drunk(drunk_adjustment)
  messages = [
    "Damn, that was a piss up, you feel #{drunk_adjustment} 🍺 drunker.",
  ]

  puts messages.sample
end

def sobered_up(drunk_adjustment)
  messages = [
    "That knocked some sense into ya, ya feel you feel #{drunk_adjustment.abs} 🍺 lighter!",
  ]

  puts messages.sample
end

def got_cash(wallet_adjustment)
  messages = [
    "You battered #{wallet_adjustment} 💵 outta some poor sod!",
  ]

  puts messages.sample
end

def got_mugged(wallet_adjustment)
  messages = [
    "You got mugged for #{wallet_adjustment.abs} 💵",
  ]

  puts messages.sample
end
