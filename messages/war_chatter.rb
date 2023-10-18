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
  when :escape   then [80,                                             escape.sample]
  when :surprise then [100, SURPRISE + " " + enemy[:name]          + surprise.sample]
  when :pwned    then [100, PWNED    + " " + enemy[:name]          +    pwned.sample]
  when :revive   then [100, SUMMON   + " " + enemy[:name]          +   revive.sample]
  when :counter  then [100, COUNTER  + " " + enemy[:name] + " 🗯️ " + counter.sample]
  end
  puts text_break(messages, " ", x)
end

# Weapon Messages

def weapon_speaks(wielder, weapon, status)
  got = [
    " You found a #{weapon} hidden among the spoons!",
    " A Djinn 🧞 grants you a wish, one #{weapon} please",
    " There's a #{weapon} inside this hollowed out book 📙",
    " You need a #{weapon}, your mad smithing skills allow it",
    " There's find a #{weapon} sandwiched between the pickles",
    " Package from Amazon 🎁 It's that #{weapon} you ordered!",
    " There's enough useless crap 🛒 here to make a #{weapon}",
    " You remembered you still have your #{weapon} in your sock 🧦",
    " 🕵🏼 Mysterious Stranger 💬 Hey kid, catch! #{weapon} acquired",
    " You reach into your pocket for a snout 🚬 and pull out a #{weapon}!",
    " Father Christmas 🎅 brings your gift early, the #{weapon} on your list",
    " Gift! There's a #{weapon} here! Looks like the foot's on the other shoe!",
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
    "#{THIEF} #{wielder[:name]} grabs the #{weapon} lying in the sink 🛁",
    "#{THIEF} #{wielder[:name]} takes their #{weapon} out of their sock 🧦",
    "#{THIEF} #{wielder[:name]} fashions a #{weapon} from their trenchcoat 🧥",
  ]
  messages =  case status
  when :got   then WEAPON +   got.sample
  when :broke then BROKE  + broke.sample
  when :enemy then          enemy.sample
  end
  puts text_break(messages, " ", 100)
end
