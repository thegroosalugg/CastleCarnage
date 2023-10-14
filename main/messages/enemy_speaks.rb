# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  spawns = "\e[35m𝓢𝓤𝓜𝓜𝓞𝓝\e[0m"
  shock = "\e[33m𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌\e[0m"
  pow = "\e[31m𝕡𝕨𝕟𝕖𝕕\e[0m"
  summon = [
    " You stare in the mirror 🔲 and slowly realise the #{enemy[:name]} staring back isn't you...",
    " Package from Amazon 🎁 but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    " Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    " Wild #{enemy[:name]} appeared❗ #{enemy[:name]}'s exerting its pressure!",
    " The phone 📞 ringing, it's #{enemy[:name]} calling for your death.",
    " #{enemy[:name]} 💬 Yargh, yer stepped into the wrong castle matey",
    " It's a full moon 🌕 #{enemy[:name]} rises from the ground 🪦",
    " #{enemy[:name]} 💬 Step on up kiddies, thrashings for all!",
    " #{enemy[:name]} was waiting for you in the thrash can 🗑️",
  ]
  escape = [
    "💬 Better leg it, don't wanna let #{enemy[:name]} get the drop on you.",
    "💬 That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "💬 Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!",
    "💬 Damn, that #{enemy[:name]}'s a wasteman, time to scram!",
    "💬 Shit shit shit shit! Bloody cheese it!",
  ]
  surprise = [
    " does a mental 🤸 backflip and landed in front of you!",
    " is faster 💨 than you. You get merked.",
    " 💬 Yar think ye can get away from me?",
    " ✨ teleports in front of the door",
    " 💬 Oi, stop and I'll shoot yar!",
    " 💬 Lend us ur phone 📱 bruv!",
    " 💬 Get back 'ere yer scum!",
    " 💬 Oi, give us 5 bucks!",
  ]
  pwned = [
    " took the 🚂 midnight train to slab city.",
    " is sleeping with the fishes 🐟",
    " turned to a ghost, boo 👻",
    " took a trip ✈️ to Belize.",
    "'s head came clean off.",
    " 💬 Argh, yar got me!",
    " was anhialated ☠",
    " was defeated ☠",
    " got shanked 🗡",
    " got got 💀",
  ]
  revive = [
    "#{spawns} #{enemy[:name]} 🪦 🧟"
  ]

  messages = case event
  when :summon   then spawns + summon.sample
  when :escape   then escape.sample
  when :surprise then shock + " " + enemy[:name] + surprise.sample
  when :pwned    then pow + " " + enemy[:name] + pwned.sample
  when :revive   then revive.sample
  end
  puts SEPARATOR if event == :pwned
  puts text_break(messages, " ", 80)
end
