# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  summon = [
    "You stare in the mirror 🔲 and slowly realise the #{enemy[:name]} staring back isn't you...",
    "Package from Amazon 🎁 but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    "Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    "Wild #{enemy[:name]} appeared❗ #{enemy[:name]}'s exerting its pressure!",
    "The phone 📞 ringing, it's #{enemy[:name]} calling for your death.",
    "#{enemy[:name]} 💬 Yargh, yer stepped into the wrong castle matey",
    "It's a full moon 🌕 #{enemy[:name]} rises from the ground 🪦",
    "#{enemy[:name]} 💬 Step on up kiddies, thrashings for all!",
    "#{enemy[:name]} was waiting for you in the thrash can 🗑️",
  ]
  escape = [
    "💬 Better leg it, don't wanna let #{enemy[:name]} get the drop on you.",
    "💬 That bastard #{enemy[:name]} is right behing me, gotta cheese it!",
    "💬 Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!",
    "💬 Damn, that #{enemy[:name]}'s a wasteman, time to scram!",
    "💬 Shit shit shit shit! Bloody cheese it!",
  ]
  surprise = [
    "#{enemy[:name]} does a mental 🤸 backflip and landed in front of you!",
    "You slip on a mouldy banana 🍌 and #{enemy[:name]} jumps you!",
    "#{enemy[:name]} is faster 💨 than you. You get merked.",
    "#{enemy[:name]} 💬 Yar think ye can get away from me?",
    "#{enemy[:name]} ✨ teleports in front of the door",
    "#{enemy[:name]} 💬 Oi, stop and I'll shoot yar!",
    "#{enemy[:name]} 💬 Lend us ur phone 📱 bruv!",
    "#{enemy[:name]} 💬 Get back 'ere yer scum!",
    "#{enemy[:name]} 💬 Oi, give us 5 bucks!",
  ]
  pwned = [
    "#{enemy[:name]} took the 🚂 midnight train to slab city.",
    "#{enemy[:name]} is sleeping with the fishes 🐟",
    "#{enemy[:name]} turned to a ghost, boo 👻",
    "#{enemy[:name]} took a trip ✈️ to Belize.",
    "#{enemy[:name]} 💬 Argh, yar got me!",
    "#{enemy[:name]}'s head came clean off.",
    "#{enemy[:name]} was anhialated ☠",
    "#{enemy[:name]} was defeated ☠",
    "#{enemy[:name]} got shanked 🗡",
    "#{enemy[:name]} got got 💀",
  ]
  revive = [
    "\e[35m𝓢𝓤𝓜𝓜𝓞𝓝\e[0m #{enemy[:name]} 🪦 🧟"
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
