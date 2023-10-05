# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  summon = [
    "There's another package from Amazon 🎁, but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    "You stare at the mirror 🔲, but you slowly realise the #{enemy[:name]} staring back isn't you...",
    "#{enemy[:name]} was waiting for you in the trash can 🚮, ready to show you he can thrash 👊",
    "Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    "The phone 📞 rings, you pick up, it's #{enemy[:name]} calling for your death.",
    "Wild #{enemy[:name]} appeared ‼ #{enemy[:name]}'s exerting its pressure!",
    "#{enemy[:name]}: 'Yargh, yer stepped into the wrong castle matey'",
    "Oh shit! You just dun goofed, #{enemy[:name]} jumped out at you!",
    "#{enemy[:name]}: 'Step on up kiddies, thrashings for all!'",
    "It's a full moon 🌕 tonight. #{enemy[:name]} steps on up.",
  ]
  escape = [
    "Damn, that #{enemy[:name]}'s a wasteman, maybe there be something in one of them rooms.",
    "Ain't sticking around 'ere, better try me luck with them rooms, innit!",
    "There's a mad motorbizzle 🏍 slabbed up 'ere, time to gank it 'n' go!",
    "Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!!",
    "That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "Better leg it, not let #{enemy[:name]} get the drop on you.",
    "Bugger it, time to get ghost 👻",
  ]
  surprise = [
    "🙈 You stacked it on your way out and let #{enemy[:name]} get the drop on you, watch out!",
    "#{enemy[:name]} did a mental 🤸 backflip and landed in front of you!",
    "👥 You tried to leg it but #{enemy[:name]} jumped ya. Bugger it.",
    "You slipped on a mouldy banana 🍌 and #{enemy[:name]} jumped ya!",
    "#{enemy[:name]} is faster 💨 than you. You get merked.",
    "#{enemy[:name]}: 'Yar think ye can get away from me?'",
    "#{enemy[:name]} ✨ teleports in front of the door",
    "#{enemy[:name]}: 'Oi, stop and I'll shoot yar!'",
    "#{enemy[:name]}: 'Lend us ur phone 📱 bruv!'",
    "#{enemy[:name]}: 'Get back 'ere yer scum!'",
    "#{enemy[:name]}: 'Oi, give us 5 bucks!",
  ]
  pwned = [
    "#{enemy[:name]} took the 🚂 midnight train to slab city.",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} turned into a ghost, whooo 👻",
    "#{enemy[:name]} took a trip ✈️ to Belize.",
    "#{enemy[:name]} died. 🎯 Bully for you!",
    "#{enemy[:name]}: 'Argh, yar got me!'",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} was defeated ☠",
    "#{enemy[:name]} got shanked 🗡",
    "#{enemy[:name]} got got 💀",
    "You knocked #{enemy[:name]}'s head clean off.",
    "You blasted #{enemy[:name]}! Flawless 💎 Victory.",
  ]

  messages = case event
  when :summon   then summon
  when :escape   then escape
  when :surprise then surprise
  when :pwned    then pwned
  end
  puts SEPARATOR if event == :pwned
  puts text_break(messages.sample, " ", 70)
end
