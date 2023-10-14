# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  spawns = "\e[35m𝓢𝓤𝓜𝓜𝓞𝓝\e[0m"
  shock = "\e[33m𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌\e[0m"
  pow = "\e[31m𝕡𝕨𝕟𝕖𝕕\e[0m"
  summon = [
    "#{spawns} You stare in the mirror 🔲 and slowly realise the #{enemy[:name]} staring back isn't you...",
    "#{spawns} Package from Amazon 🎁 but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    "#{spawns} Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    "#{spawns} Wild #{enemy[:name]} appeared❗ #{enemy[:name]}'s exerting its pressure!",
    "#{spawns} The phone 📞 ringing, it's #{enemy[:name]} calling for your death.",
    "#{spawns} #{enemy[:name]} 💬 Yargh, yer stepped into the wrong castle matey",
    "#{spawns} It's a full moon 🌕 #{enemy[:name]} rises from the ground 🪦",
    "#{spawns} #{enemy[:name]} 💬 Step on up kiddies, thrashings for all!",
    "#{spawns} #{enemy[:name]} was waiting for you in the thrash can 🗑️",
  ]
  escape = [
    "💬 Better leg it, don't wanna let #{enemy[:name]} get the drop on you.",
    "💬 That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "💬 Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!",
    "💬 Damn, that #{enemy[:name]}'s a wasteman, time to scram!",
    "💬 Shit shit shit shit! Bloody cheese it!",
  ]
  surprise = [
    "#{shock} #{enemy[:name]} does a mental 🤸 backflip and landed in front of you!",
    "#{shock} You slip on a mouldy banana 🍌 and #{enemy[:name]} jumps you!",
    "#{shock} #{enemy[:name]} is faster 💨 than you. You get merked.",
    "#{shock} #{enemy[:name]} 💬 Yar think ye can get away from me?",
    "#{shock} #{enemy[:name]} ✨ teleports in front of the door",
    "#{shock} #{enemy[:name]} 💬 Oi, stop and I'll shoot yar!",
    "#{shock} #{enemy[:name]} 💬 Lend us ur phone 📱 bruv!",
    "#{shock} #{enemy[:name]} 💬 Get back 'ere yer scum!",
    "#{shock} #{enemy[:name]} 💬 Oi, give us 5 bucks!",
  ]
  pwned = [
    "#{pow} #{enemy[:name]} took the 🚂 midnight train to slab city.",
    "#{pow} #{enemy[:name]} is sleeping with the fishes 🐟",
    "#{pow} #{enemy[:name]} turned to a ghost, boo 👻",
    "#{pow} #{enemy[:name]} took a trip ✈️ to Belize.",
    "#{pow} #{enemy[:name]} 💬 Argh, yar got me!",
    "#{pow} #{enemy[:name]}'s head came clean off.",
    "#{pow} #{enemy[:name]} was anhialated ☠",
    "#{pow} #{enemy[:name]} was defeated ☠",
    "#{pow} #{enemy[:name]} got shanked 🗡",
    "#{pow} #{enemy[:name]} got got 💀",
  ]
  revive = [
    "#{spawns} #{enemy[:name]} 🪦 🧟"
  ]

  messages = case event
  when :summon   then summon
  when :escape   then escape
  when :surprise then surprise
  when :pwned    then pwned
  when :revive   then revive
  end
  puts SEPARATOR if event == :pwned
  puts text_break(messages.sample, " ", 80)
end
