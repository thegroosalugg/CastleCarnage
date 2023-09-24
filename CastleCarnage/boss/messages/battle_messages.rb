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

def bar_fight_outcome(drunk_adjustment, wallet_adjustment)
  got_drunk = [
    "Damn, that was a piss up, you feel #{drunk_adjustment} 🍺 drunker.",
  ]
  sober_up = [
    "That knocked some sense into ya, ya feel you feel #{drunk_adjustment.abs} 🍺 lighter!",
  ]
  got_cash = [
    "You battered #{wallet_adjustment} 💵 outta some poor sod!",
  ]
  got_mugged = [
    "You got mugged for #{wallet_adjustment.abs} 💵",
  ]

  puts (drunk_adjustment.positive? ? got_drunk.sample : sober_up.sample)
  puts (wallet_adjustment.positive? ? got_cash.sample : got_mugged.sample)
end
