# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

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

def counter(player, the_boss, counter_attack)
  messages = [
    "#{the_boss[:name]} spotted you being a plank and served you for #{player[:emoji]} #{counter_attack} damage.",
  ]

  puts text_break(messages.sample, " ", 70)
end

def gained(player, stuff, type)
  life = [
    "Oi, oi, you lucky people, you swagged #{player[:emoji]} #{stuff} HP along the way, you sneaky 👟 bastard!",
  ]
  cash = [
    "You ganked a hefty bit of loot, #{stuff} 💵 for your pocket. Spend it wisely!",
  ]
  messages = case type
  when :life then life
  when :cash then cash
  end

  puts text_break(messages.sample, " ", 70)
end
