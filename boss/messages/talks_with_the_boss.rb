# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = [
    "You've been blessed, dark magics grant you #{player[:emoji]} #{health} HP, your #{boost} grows by #{multiplier}. Go get 'em.",
  ]

  puts text_break(messages.sample, " ", 70)
end

def greeting
  messages = [
    "Step on up and show who's the boss",
  ]

  puts text_break(messages.sample, " ", 70)
end

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
