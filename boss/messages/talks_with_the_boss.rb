# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = [
    "You've been blessed, dark magics grant you #{player[:emoji]} #{health} HP, your #{boost} grows by #{multiplier}. Go get 'em.",
    "Bodies all around you, you gorge #{player[:emoji]} #{health} HP, your #{boost} grows by #{multiplier}.",
  ]

  puts text_break(messages.sample, " ", 80)
end

def greeting(place)
  enemy = [
    "Strike first, strike hard, no mercy",
    "Step on up and show who's the boss",
    "Will you get got, or you gone get?",
    "Time to walk the dinosaur 🦕",
    "Time for a thrashing",
    "Lay down the law",
  ]
  shop = [
    "🧞💬 Welcome, Stranger...",
  ]

  messages = place == :combat ? enemy : shop
  puts text_break(messages.sample, " ", 80)
end

# Intro outro messages for changes to boss fighting style

def boss_walks(the_boss, boss_style, time)
  barkeep = [
    "The #{boss_style} is keeping the liquor flowng, its happy hour ⌚",
    "#{the_boss[:name]} is getting close to barring you, prepare!",
    "The #{boss_style} is in the house 🛖 orders up",
    "#{the_boss[:name]} is the liquor 🍾",
  ]
  bouncer = [
    "#{the_boss[:name]} is excerting its pressure, you drink another beer 🍺",
  ]
  band = [
    "Some wanker just started playing dubstep 🎧 you're gonna take some serious damage this round.",
    "#{the_boss[:name]} is two-stepping across the room 🤾, Parkway Drive 🎸 appear on stage!",
    "#{the_boss[:name]} is smashing some banging tunes 🎸 a mosh pit is about to break out!",
    "🎧 Sandstorm by Darude starts playing, shit's 'bout to get proper 🎶",
  ]
  outro = [
    "#{the_boss[:name]} had enough of your shit as it prepares #{boss_style} stance",
    "#{the_boss[:name]} assumes the #{boss_style} fighting stance, watch out!",
    "#{the_boss[:name]} is commercially trained in #{boss_style} style",
    "#{the_boss[:name]} switches up to #{boss_style} style",
  ]
  reprise = [
    "You're slighly less wasted, your alcohol goes down one 🍺",
    "That was quite a mash up, you're one 🍺 lighter.",
    "You sweat out a 🍺 your hangover decreases",
  ]

  messages = case boss_style
  when "🍻 Barkeep" then time == :intro ? barkeep : outro
  when "🕶️ Bouncer" then time == :intro ? bouncer : outro
  when "🎶 Band"    then (time == :reprise) ? reprise : (time == :intro) ? band : outro
  end
  puts text_break(messages.sample, " ", 80)
end

def boss_speaks(player, the_boss, blast = 0, outcome)
  player = player[:id] == :player ? "you" : player[:name]
  hit = [
    "#{the_boss[:name]} has had enough of your crap, they blast #{player} for 💢 #{blast} damage!",
    "#{the_boss[:name]} is on a mad one, they merk #{player} for 💢 #{blast} damage!",
  ]
  threat = [
    "#{the_boss[:name]} notices your cowardly attempts, a thrashing is on the cards",
    "#{the_boss[:name]} is getting aggy, you better pick your moves carefully",
  ]

  messages = outcome == :hit ? hit : threat
  puts SEPARATOR
  puts text_break(messages.sample, " ", 80)
end
