# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = "#{HP_PLUS} +#{health} #{player[:emoji]} / #{BUFF} +#{multiplier} #{boost}"

  puts text_break("#{BONUS}", " ", 80)
  puts text_break(messages, " ", 80)
end

def greeting(place)
  enemy = [
    "Strike first, strike hard, no mercy",
    "Step on up and show who's the boss",
    "Will you get got, or you gone get?",
    "Time for a thrashing",
    "Lay down the law",
  ]
  shop = [
    "🧞💬 山🝗㇄⼕ㄖ爪🝗 丂〸尺闩𝓝Ꮆ🝗尺...",
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
  bouncer = [ "#{the_boss[:name]} is excerting its pressure #{HANGOVER} +1 🍺" ]
  band = [
    "#{the_boss[:name]} is two-stepping 🪜 in the pit. Parkway Drive 🎸 come out on stage!",
    "#{the_boss[:name]} is smashing out banging tunes 🎸 A pit is 'bout to break out!",
    "Some wanker just started playing dubstep 🎧 Get damage ready",
    "Darude Sandstorm 🎧 starts playing, shit's 'bout to go down",
  ]
  outro = [ "#{the_boss[:name]} ♻️ ▻◅▶▷ #{boss_style}" ]
  reprise = [ "#{HANGOVER} -1 🍺" ]

  messages = case boss_style
  when "🍻 Barkeep" then time == :intro ? barkeep : outro
  when "🕶️ Bouncer" then time == :intro ? bouncer : outro
  when "🎶 Band"    then (time == :reprise) ? reprise : (time == :intro) ? band : outro
  end
  puts text_break(messages.sample, " ", 80)
end

def boss_speaks(player, the_boss, blast = 0, outcome)
  hit = [
    "#{the_boss[:name]} has had enough of your crap 🔥 #{RAGE} 💢 #{player[:name]} -#{blast} #{player[:emoji]}",
  ]
  threat = [
    "#{the_boss[:name]} notices your cowardly attempts, a thrashing #{RAGE} is on the cards",
    "#{the_boss[:name]} is getting aggy #{RAGE} You best tread lightly",
  ]

  messages = outcome == :hit ? hit : threat
  puts text_break(messages.sample, " ", 80)
end
