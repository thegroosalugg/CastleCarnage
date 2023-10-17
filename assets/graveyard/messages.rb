# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Boss Rage

def boss_speaks(player, the_boss, blast = 0, outcome)
  hit = [
    "#{the_boss[:name]} has had enough of your crap #{RAGE} 🪔 #{player[:name]} -#{blast} #{player[:emoji]}",
  ]
  threat = [
    "#{the_boss[:name]} notices your cowardly attempts, a thrashing #{RAGE} is on the cards",
    "#{the_boss[:name]} is getting aggy #{RAGE} You best tread lightly",
  ]

  messages = outcome == :hit ? hit : threat
  puts text_break(messages.sample, " ", 100)
end

# end of main game rewards message

def your_rewards(player, health, boost, multiplier)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  messages = "#{MUNCH} +#{health} #{player[:emoji]}  #{BUFF} +#{multiplier} #{boost}"

  puts text_break("#{BONUS}", " ", 80)
  puts text_break(messages, " ", 90)
end

# Intro outro messages for changes to boss fighting style

def boss_walks(the_boss, boss_style, time)
  barkeep = [
    "The #{STYLE[boss_style]} is keeping the liquor flowng, its happy hour ⌚",
    "#{the_boss[:name]} is getting close to barring you, prepare!",
    "The #{STYLE[boss_style]} is in the house 🛖 orders up",
    "#{the_boss[:name]} is the liquor 🍾",
  ]
  bouncer = [ "#{the_boss[:name]} is excerting its pressure #{HANGOVER} +1 🍺" ]
  band = [
    "#{the_boss[:name]} is two-stepping 🪜 in the pit. Parkway Drive 🎸 come out on stage!",
    "#{the_boss[:name]} is smashing out banging tunes 🎸 A pit is 'bout to break out!",
    "Some wanker just started playing dubstep 🎧 Get ready for damage",
    "Darude Sandstorm 🎧 starts playing, shit's 'bout to go down",
  ]
  outro = [ "#{the_boss[:name]} ♻️ ▻◅▶▷ #{STYLE[boss_style]}" ]
  reprise = [ "#{HANGOVER} -1 🍺" ]

  x, messages = case boss_style
  when :barkeep then time == :intro ? [80, barkeep] : [85, outro]
  when :bouncer then time == :intro ? [100, bouncer] : [85, outro]
  when :band    then (time == :reprise) ? [90, reprise] : [85, (time == :intro) ? band : outro]
  end
  puts text_break(messages.sample, " ", x)
end

# error messages

money = [
  "Bring money",
  "Bring more money",
]
weapon_empty = [
  "Bring a proper weapon",
]
weapon_full = [
  "You already got a weapon",
]
wait = [
  "Once per turn, you melt!",
  "Uh-uh! I don't think so!",
  "Soz (but also no) ",
  "Don't get greedy! ",
  "Next round buddy!",
]

error = [ # kill these. Keeping them for the lingo for now
  " Don't be a pillock ‼ ",
  " Don't be a plonker ‼ ",
  " Don't be a plank ‼ ",
  " Don't be a plum ‼ ",
  " Don't be a fool ‼ ",
  " Nobody likes a joker ‼ ",
  " Quit clowning around ‼ ",
  " Quit faffing around ‼ ",
  " Quit being a melon ‼ ",
]
