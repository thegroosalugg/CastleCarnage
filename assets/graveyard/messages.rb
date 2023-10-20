# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

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

denied = [
  "Just No ⛔",
  "Get Lost ⛔",
  "Out of Stock ⛔",
  "We Don't Have It ⛔",
  "You Can't Have That ⛔",
]
["#{ML}#{ICONS.sample}#{CL}", 50, "#{ML}#{denied.sample}#{CL}"]
padding_generator(messages, char, n)
