# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

FIGHTING_WORDS = {
  :hit  => ["Ah yeah! ", "Bangers 'n' Mash u up! ", "I own it! ", "Take that! ", "I'm jus' too good ", "Bow to me! ", "Falcon Punch! "],
  :crit => ["Blao! ", "Bam! ", "Ka-Pow! ", "Eat my wrath ", "You die now! ", "Smashed! ", "Ka-Blam! ", "Bye-bye! "],
  :miss => ["Motherfucker! ", "Bugger it! ", "Bloody hell! ", "Arses! ", "Sod it! ", "Bollocks! ", "Shit! ", "I call hacks! "]
}
COMEBACKS = {
  :hit  => ["Hey, fuck you!", "You dick!", "What a shit..", "Hate that guy", "Ouch!", "What you do that for?", "Oooff!", "You fucker!"],
  :crit => ["You bastard!", "Noooooo!", "WTF!", "You cheating git!", "Imma get ya for that!", "Wanker!"],
  :miss => ["Ha! What a douche!", "Ha! Did you miss me?", "Loser!", "Nice shot bro!", "What a joker!", "Clown", "Can't touch this!"]
}
ITEM_SHOUT = [
  "Delicious!", "Meh, eat it anyway", "Egh! Rank!", "Fucking A!", "What idiot left this here!",
  "5 second rule!", "Might as well", "Holy shit!", "This looks swell!", "Sweet as!", "Dinner sorted!",
  "No way! Is it back?", "Who left this 'ere?", "This will do!", "What's one more, ey!", "Still eat it"
]
GOT_SHOUT = [
  "looks in the fridge 🗒️ and prepares a", "🪔🧞 Djinn 💬 Here you go mate! Acquired", "This cookbook 📙 contains a recipe for a",
  "'s mad smithing skills allow 'em to craft a ", "🚪🎁 Amazon 💬 delivery! Acquired", " There's enough useless crap 🛒 here to make a",
  "checks their socks and withdraws a ", "🚪🕵🏼 Mysterious Stranger 💬 Hey kid, catch! Acquired", "💬 Looks like the foot's on the other shoe!",
  "reaches for a snout 🚬 and pulls out a", "🚪🎅 Father Xmas 💬 Ho-ho-ho! Acquired",
]
BROKE_SHOUT = [
  "is no more", "jumps and runs off", "busted!", "did a runner","disappears into thin air", "flew out of the window!", "you will be missed",
  "resigned from service", "is too shoddy", "was proper pony", "melted",
]
SPAWN_SHOUT = [
  "was waiting in the thrash can 🗑️", "💬 Step on up kiddies, thrashings for all!", "rises from the dirt 🪦", "is calling for your death.",
   "💬 Yargh, yer stepped into the wrong castle matey", "appeared! It's exerting its pressure!", "💬 C'mon chief, give us a mission",
  "sprung out the fridge 🧊, they coming right for ya!", "has an order for bloodshed!", "💬 Reporting for duty",
]
BEER_SHOUT = [
  " 💬 Sweet as!", " 💬 These are going down like skittles", " 💬 Egh, fosters", " 💬 How many calories is this?",
  " 💬 Sunk!", " 💬 burp", " 💬 On a day like this, why not",
]
RUN_SHOUT = [
  "Dammit, gotta dash to a gaff quick, or I'm munched!", "Those bastards are right behing me, leeegg it!", "Damn, them wasteman, time to scram!",
  "Where's a Mackie D's when you need one?", "Shit shit shit shit! Bloody cheese it!", "Bloody hell, what's with this place?",
]
SURPRISE_SHOUT = [
  " 💬 Oi, give us 5 bucks!", " 💬 Get back 'ere yer scum!", " 💬 Lend us ur phone 📱 bruv!", " 💬 Oi, stop and I'll shoot yar!",
  " #{TELEPORT} in front of the door", " 💬 Yar think ye can get away from me?", " is faster 💨 than you. You get merked.",
  " does a mental 🤸 backflip and lands in front of you!",
]
PWNED_SHOUT = [
  " took the 🚂 midnight train to slab city.", " is sleeping with the fishes 🐟", " took a trip ✈️ to Belize.", " turned to a ghost, boo 👻",
  "'s head came clean off.", " 💬 Argh, yar got me!", " was anhialated ☠️", " got shanked 🗡", " got got 💀",
]
COUNTER_SHOUT = [
  "Ha, I don't think so!", "Not this time!", "#{POW}", "#{KABLAMO}", "You wish bruv",
]
ROOM_SHOUT = [
  "Deffos smelled some nosh in", "Got a massively good feeling about", "Fuck it, let's have a look around", "Saw some shit in",
  "Need a slash so bad! Bugger it, in we go to", "They won't find me in", "Let's 'ave it! In we go to", "Always wanted to see",
]
ERRORS = [
  "Don't be a pillock! ", "Don't be a plonker! ", "Don't be a plank! ", "Don't be a plum! ", "Don't be a fool! ",
  "Nobody likes a joker! ", "Quit clowning around! ", "Quit faffing around! ", "Quit being a melon! ",
    ]
COMBAT_SHOUT = [
  "Bring it!", "C'mon let's 'ave it!", "Let's do this now!", "Come on 'ave a go!", "Castle hill massive!",
  "No mercy!", "Charge!", "Watch it geez!", "What yer lookin' at?!", "I'll 'ave u!"
]
GAME_SHOUT = [
  "Line 'em Frankie, line 'em up", "You's about to go dooooown!", "Don't fuck with the master", "Your life total is about to get shuffled!",
  "You will be judged", "Are you willing to stand with the righteous?",
]
GAME_TAUNT = [
  "I'm gonna enjoys this", "You're gonna get it now!", "Oh-ho-ho-ho-ho!", "This is gonna be sweet!", "Time for your beating!",
  "Get ready to quit life!", "I'is gonna ctrl, shift 'n' do you in!", "Clobbering time!",
]
GANKED_SHOUT = [
  "Wait, where's my ", "Shit! Who took my ", "My ", "Where the fuck is my ", "Noooooo! My ", "Swear down I had my ",
]
INTRO_SHOUT = [
  "jumps 🥏 from the ceiling! 💬 You goon get it now boy!",
  "busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
]
INTRO_CALLBACK = [
  "#{TELEPORT} behind 'em'. 💬 Nothing personnel, kid", "💬 We won't get got, we gone get!",
  "pulls out their trusty 🔪 #{YL}katana#{CL} from their trench coat tips their fedora.",
]
WIN_SHOUT = [
  "had a sudden heart attack, you win by default.", "got blasted to another dimension. Your power level has increased.",
  "was splatted like a grape.",
]
LOSE_SHOUT = [
  "laughs at your misfortune.", "ripped your head off. You won't be coming home for dinner.", "shall feast on your entrails.",
]
GOODBYE = [
  "Good riddance!", "Don't hurry back!", "Ha, loser!", "Only cause I was gonna beat ya"
]
