# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def style_intro(the_boss, boss_style)
  barkeep = [
    "The #{boss_style} is in the house 🛖 orders up",
  ]
  bouncer = [
    "#{the_boss[:name]} is excerting its pressure, you drink another beer 🍺",
  ]
  toilet_guy = [
    "#{boss_style} here, draw your wallet 👛",
  ]

  messages = case boss_style
  when "🍻 Barkeep"    then barkeep
  when "🕶️ Bouncer"    then bouncer
  when "🚾 Toilet Guy" then toilet_guy
  end
  puts text_break(messages.sample, " ", 70)
end

# BARKEEP STYLE
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def bar_fight_outcome(beers, wallet)
  got_drunk = [
    "Damn, that was a piss up, you feel #{beers} 🍺 drunker.",
  ]
  sober_up = [
    "That knocked some sense into ya, ya feel you feel #{beers.abs} 🍺 lighter!",
  ]
  got_cash = [
    "You battered #{wallet} 💵 outta some poor sod!",
  ]
  got_mugged = [
    "You got mugged for #{wallet.abs} 💵",
  ]

  drunk = beers.positive? ? got_drunk : sober_up
  wallet = wallet.positive? ? got_cash : got_mugged
  puts text_break(drunk.sample, " ", 70)
  puts text_break(wallet.sample, " ", 70)
end

def paid_the_tab(cash_spent)
  messages = [
    "You doled out #{cash_spent} 💵 and ate up #{cash_spent} 🍺 drinks. Time for some dishing.",
  ]

  puts text_break(messages.sample, " ", 70)
end

# BOUNCER STYLE

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
