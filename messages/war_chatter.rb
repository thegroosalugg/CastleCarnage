# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def enemy_speaks(enemy, event)
  summon = [
    " You stare in the mirror 🔲 and slowly realise the #{enemy[:name]} staring back isn't you...",
    " Package from Amazon 🎁 but oh shit! It's #{enemy[:name]} with an order for bloodshed!",
    " Motherfucking #{enemy[:name]} sprung out the fridge 🧊, they coming right for ya!",
    " Wild #{enemy[:name]} appeared❗ #{enemy[:name]}'s exerting its pressure!",
    " The phone 📞 is ringing, it's #{enemy[:name]} calling for your death.",
    " #{enemy[:name]} 💬 Yargh, yer stepped into the wrong castle matey",
    " It's a full moon 🌕 #{enemy[:name]} rises from the dirt 🪦",
    " #{enemy[:name]} 💬 Step on up kiddies, thrashings for all!",
    " #{enemy[:name]} was waiting for you in the thrash can 🗑️",
  ]
  escape = [
    "💬 Dammit, gotta dash to a gaff quick, or I'm #{enemy[:name]} food!",
    "💬 That bastard #{enemy[:name]} is right behing me, leeegg it!",
    "💬 Damn, that #{enemy[:name]}'s a wasteman, time to scram!",
    "💬 Shit shit shit shit! Bloody cheese it!",
    "💬 Bloody hell, what's with this place?",
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
    " 💬 C'mon chief, give us a mission.",
    " rises 🧟 from the loam 🪦",
    " reporting for duty.",
  ]

  x, messages = case event
  when :summon   then [100, SUMMON + summon.sample]
  when :escape   then [80, escape.sample]
  when :surprise then [100, SURPRISE + " " + enemy[:name] + surprise.sample]
  when :pwned    then [100, PWNED + " " + enemy[:name] + pwned.sample]
  when :revive   then [100, SUMMON + " " + enemy[:name] + revive.sample]
  end

  puts text_break(messages, " ", x)

end

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

# Weapon Messages

def weapon_speaks(weapon, status)
  got = [
    " There's enough useless crap 🛒 here to make a #{weapon}, your mad smithing skills allow it",
    " Father Christmas 🎅 brings your gift early, it's that #{weapon} you wished for",
    " Gift! There's a #{weapon} here! Looks like the foot's on the other shoe!",
    " You reach into your pocket for a snout 🚬 and pull out a #{weapon}!",
    " You remembered you still have your #{weapon} in your sock 🧦",
    " 🕵🏼 Mysterious Stranger 💬 Hey kid, catch! #{weapon} acquired",
    " Package from Amazon 🎁 It's that #{weapon} you ordered!",
    " There's find a #{weapon} sandwiched between the pickles",
    " There's a #{weapon} inside this hollowed out book 📙",
    " A Djinn 🧞 grants you a wish, one #{weapon} please",
    " You found a #{weapon} hidden among the spoons!",
  ]
  broke = [
    " The universe conspires against you. Your #{weapon} melts!",
    " Your #{weapon} jumps ouuta your hand and runs off",
    " You suddenly forgot how to wield your #{weapon}",
    " Oh shit! Your #{weapon} broke. Better leg it!",
    " Poxy #{weapon} gon 'n' did a runner on you",
    " Your #{weapon} disappears into thin air",
    " Your #{weapon} flew out of the window!",
    " Goodbye #{weapon}, you will be missed",
    " Your #{weapon} resigned from service",
    " Damn it! You dropped your #{weapon}!",
    " Your #{weapon} was too shoddy",
  ]
  enemy = [
    "Enemy acquired weapon"
  ]
  messages = case status
  when :got then WEAPON + got.sample
  when :broke then BROKE + broke.sample
  when :enemy then enemy.sample
  end
  puts text_break(messages, " ", 100)
end
