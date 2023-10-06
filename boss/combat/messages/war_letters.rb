# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Intro outro messages for changes to boss fighting style

def boss_walks(the_boss, boss_style, time)
  barkeep = [
    "The #{boss_style} is in the house 🛖 orders up",
    "The #{boss_style} is keeping the liquor flowng, its happy hour ⌚",
  ]
  bouncer = [
    "#{the_boss[:name]} is excerting its pressure, you drink another beer 🍺",
  ]
  band = [
    "#{the_boss[:name]} is playing 🎸 rocking music, a mosh pit is about to break out!",
    "#{the_boss[:name]} is two-stepping across the room 🤾, Parkway Drive 🎸 appear on stage!",
    "Some wanker just started playing dubstep 🎧 you're gonna take some serious damage this round.",
  ]
  outro = [
    "#{the_boss[:name]} assumes the #{boss_style} fighting stance, watch out!",
  ]
  reprise = [
    "That was quite a mash up, you're one 🍺 lighter.",
  ]

  messages = case boss_style
  when "🍻 Barkeep" then time == :intro ? barkeep : outro
  when "🕶️ Bouncer" then time == :intro ? bouncer : outro
  when "🎶 Band"    then (time == :reprise) ? reprise : (time == :intro) ? band : outro
  end
  puts text_break(messages.sample, " ", 70)
end

# Invoice for stat changes
# Bar fight outcomes # .abs removes negatives so only positive integers displayed

def invoice(player, amount, where)
  got_drunk = [ # bar fight
    "Damn, that was a piss up, you feel #{amount[0]} 🍺 drunker.",
  ]
  sober_up = [
    "That knocked some sense into ya, ya feel you feel #{amount[0].abs} 🍺 lighter!",
  ]
  got_cash = [
    "You battered #{amount[1]} 💵 outta some poor sod!",
  ]
  got_mugged = [
    "You got mugged for #{amount[1].abs} 💵",
  ]
  bar = [ # pay the tab
    "You doled out #{amount} 💵 and ate up #{amount} 🍺 drinks. Time for some dishing.",
  ]
  skint = [
    "You're too skint to get a drink, the damage you deal is reduced.",
  ]
  xcore = [ # xhardcorex
    "You got trampled and lost #{amount} 💵 your damage is reduced.",
  ]
  broke = [
    "You're skint and got nothing to lose, but that don't mean you can't take extra damage!",
  ]
  pit = [ # mosh pit
    case player[:drunk]
    when 0..2   then "You're well knackered 😩 your damage is hemel."
    when 3..5   then "Got a buzz on 😉 you start to headbang!"
    when 6..9   then "One sixer sunk, getting the two-step on."
    when 10..13 then "Whisky 🥃 armour on. Time to start windmilling ☠️"
    when 14..17 then "You feel invincible, nothins guna stp u nw 🤤 "
    when 18..20 then "🍺🍻😏🤪🥳😉🥴🤤😵"
    end
  ]
  guard = [ # not tonight
    "Your weapon provided an extra #{amount} 🛡️ block, better use it wisely.",
  ]
  life = [ # sneak attack
    "Oi, oi, you lucky people, you swagged #{player[:emoji]} #{amount} HP along the way, you sneaky 👟 bastard!",
  ]
  cash = [
    "You ganked a hefty bit of loot, #{amount} 💵 for your pocket. Spend it wisely!",
  ]

  messages = case where
  when :brawl # bar fight
    beers = amount[0].positive? ? got_drunk : sober_up
    cash = amount[1].positive? ? got_cash : got_mugged
    [[beers.sample, cash.sample].join(' ')]
  when :tab   then amount.zero? ? skint : bar # pay the tab
  when :xcore then amount.zero? ? broke : xcore # xhardcorex
  when :pit   then pit # mosh pit
  when :club  then guard # not tonight
  when :life  then life # sneak attack
  when :cash  then cash
  end
  puts text_break(messages.sample, " ", 70)
end

def step_on_up
  puts SEPARATOR
  puts "    Show your moves..."
  puts "   [1] 🧊 Blue Steel"
  puts "   [2] 🐯 Le Tigre"
  puts "   [3] 🍦 Magnum"
end

def show_your_moves(player, the_boss, user_choice, boss_moves)
  move_names = {
    1 => "🧊 Blue Steel",
    2 => "🐯 Le Tigre",
    3 => "🍦 Magnum"
  }
  lose = [
    "#{the_boss[:name]} got mad style 💫 The crowd is going mental.",
    "⛷️🤺🏃🕴️ The Crowd: '#{the_boss[:name].upcase} #{the_boss[:name].upcase} #{the_boss[:name].upcase}'",
  ]
  win = [
    "With the grace of a falcon 🦅 you're stealing the show",
    "⛷️🤺🏃🕴️ The Crowd: '#{player[:name].upcase} #{player[:name].upcase} #{player[:name].upcase}'",
  ]
  draw = [
    "You both suck and slap 🤚 each other in the face mid spin."
  ]

  messages = ""
  boss_moves.each do |move|
    messages = case
    when move == 1 && user_choice == 3 then lose
    when move == 3 && user_choice == 1 then win
    when move < user_choice            then win
    when move > user_choice            then lose
    when move == user_choice           then draw
    end
    puts text_break("#{player[:name]} #{move_names[user_choice]} || #{the_boss[:name]} #{move_names[move]}", " ", 70)
  end
  puts SEPARATOR
  puts text_break(messages.sample, " ", 70)
end
