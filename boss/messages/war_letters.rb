# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def damage_info(the_boss, damage)
  messages = [
   "You smashed #{the_boss[:name]} in for like 💢 #{damage} damage, surfs up bro!",
   "Time for a mashing up, #{the_boss[:name]} got weighed in for 💢 #{damage} damage!",
  ]

  puts text_break(messages.sample, " ", 70)
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

  drunk = drunk_adjustment.positive? ? got_drunk : sober_up
  wallet = wallet_adjustment.positive? ? got_cash : got_mugged
  puts text_break(drunk.sample, " ", 70)
  puts text_break(wallet.sample, " ", 70)
end
