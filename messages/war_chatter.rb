# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  summon = [
    " #{enemy[:name]} was waiting for you in the thrash can 🗑️",
    " #{enemy[:name]} 💬 Step on up kiddies, thrashings for all!",
    " It's a full moon 🌕 #{enemy[:name]} rises from the dirt 🪦",
    " #{enemy[:name]} 💬 Yargh, yer stepped into the wrong castle matey",
    " The phone 📞 is ringing, it's #{enemy[:name]} calling for your death.",
    " Wild #{enemy[:name]} appeared❗ #{enemy[:name]}'s exerting its pressure!",
    " Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    " Package from Amazon 🎁 but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    " You stare in the mirror 🔲 and slowly realise the #{enemy[:name]} staring back isn't you...",
  ]
  escape = [
    "💬 Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!",
    "💬 That bastard #{enemy[:name]} is right behing me, leeegg it!",
    "💬 Damn, that #{enemy[:name]}'s a wasteman, time to scram!",
    "💬 Where's a Mackie D's when you need one?",
    "💬 Shit shit shit shit! Bloody cheese it!",
    "💬 Bloody hell, what's with this place?",
  ]
  surprise = [
    " 💬 Oi, give us 5 bucks!",
    " 💬 Get back 'ere yer scum!",
    " 💬 Lend us ur phone 📱 bruv!",
    " 💬 Oi, stop and I'll shoot yar!",
    " ✨ teleports in front of the door",
    " 💬 Yar think ye can get away from me?",
    " is faster 💨 than you. You get merked.",
    " does a mental 🤸 backflip and lands in front of you!",
  ]
  pwned = [
    " took the 🚂 midnight train to slab city.",
    " is sleeping with the fishes 🐟",
    " took a trip ✈️ to Belize.",
    " turned to a ghost, boo 👻",
    "'s head came clean off.",
    " 💬 Argh, yar got me!",
    " was anhialated ☠",
    " was defeated ☠",
    " got shanked 🗡",
    " got got 💀",
  ]
  revive = [
    " reporting for duty.",
    " rises 🧟 from the loam 🪦",
    " 💬 C'mon chief, give us a mission.",
  ]
  counter = [
    "Ha, I don't think so!",
    "Not this time!",
    "#{POW}",
  ]

  x, messages  = case event
  when :summon   then [100, SUMMON   +                                 summon.sample]
  when :escape   then [ 80,                                            escape.sample]
  when :surprise then [100, SURPRISE + " " + enemy[:name]          + surprise.sample]
  when :pwned    then [100, PWNED    + " " + enemy[:name]          +    pwned.sample]
  when :revive   then [100, SUMMON   + " " + enemy[:name]          +   revive.sample]
  when :counter  then [100, COUNTER  + " " + enemy[:name] + " 🗯️ " + counter.sample]
  end
  puts text_break(messages, " ", x)
end
