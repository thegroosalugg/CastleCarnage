# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ENEMIES = [
  "👺 Goblin", "👹 Ogre", "👾 Orc", "🧌 Troll", "🤷 Villager", "🦟 Cazador", "🐊 Croc", "🦈 Shark", "🚁 Chopper",
  "🧙 Wizard", "🧝 Druid", "🐺 Werewolf", "🧛 Vampire", "🧟 Zombie", "🦖 Dinosaur", "🤖 Robot", "🪿 Goose", "🦏 Rhino",
  "🐉 Dragon", "👻 Banshee", "🦹 Chris R", "🦍 Gorilla", "🐍 Snake", "🦑 Kraken", "🦂 Scorpion", "🎠 Knight",
]

WEAPONS = [
  "🏏 Fungo Bat", "🥊 Bx Gloves", "🔪 Machete", "🔱 Spear", "🗡️ Sword", "🎇 Mace", "🍢 Club", "🔧 Wrench", "🪤 Trap", "🦯 Staff",
  "🪄 Scepter", "🏹 Crossbow", "🪚 Chainsaw", "🔫 MAC-11", "🪃 Boomerang", "⚔️ Battle Axe", "🪓 Hatchet", "🧨 Dynamite",
]

SPECIAL = [
  "🪡 Laser Gun", "🚀 RPG", "🔥 Fireball", "💣 Bo-Bomb", "🛫 AirStrike","🦄 Unicorn"
]

ROOMS = [
  "Bathroom 🛁", "Dining Room 🍽️", "Library 📚", "Bedroom 🛌", "Kitchen 🍳", "Living Room 🛋",
  "Game Room 🎮", "Home Office 🖥", "Garage 🚗", "Attic 🕸", "Basement 🕳", "Garden 🌳",
  "Patio 🏞", "Balcony 🏙", "Pantry 🍏", "Closet 🧥", "Laundry Room 🧺", "Guest Bedroom 🛌",
  "Study 📖", "Foyer 🚪", "Sunroom ☀️", "Mudroom 🧦", "Theater Room 🎬", "Gym for Muscles 🏋️‍♂️",
  "Pool Room 🎱", "Wine Cellar 🍷", "Music Room 🎵", "Art Studio 🎨", "Craft Room ✂️", "Nightclub 🕋",
  "Workshop ⚒️", "Sauna 🧖‍♂️", "Guest Bathroom 🚿", "Playroom 🧸", "Nursery 👶", "Bar 🍸",
  "Cinema 🍿", "Billiards Room 🎱", "Den 📺", "Lounge 🍹", "Conservatory 🌿",
  "Porch 🏡", "Walk-In Closet 👗", "Wine Tasting Room 🍇", "Cigar Lounge 🚬", "Reading Nook 📚",
  "Secret Passage 🗝", "Observatory 🔭", "Greenhouse 🌱", "Dance Studio 💃", "Recording Studio 🎤",
  "Arcade 🕹️", "Arcane Library 📜", "Chapel ⛪", "Crypt 💀", "Hidden Chamber 🕳", "Laboratory 🧪",
]

DESC = [
  "💩 The Manky", "⛏️ The Shoddy", "🧛 Dracula's", "🏢 The Swanky", "🐝 The Buzzing", "🍷 The Dodgy", "🩸 The Bloody",
  "🎉 The Reem", "🐴 The Pony", "🤬 The Bastard", "🤩 The Peng", "🤪 The Mental", "👹 The Wicked", "🎭 The Dramatic",
  "🎤 The Groovy", "🎃 The Spooky", "🚢 The Nautical", "🍔 The Greasy", "🌑 The Abandoned", "😵 The Bonkers", "🎸 The Rocking",
  "🍄 The Shroomy", "🦁 The Roaring", "🌵 The Deserted", "🤢 The Gnarly", "🏛️ The Presidential", "🔮 The Trippy", "🤮 The Minging",
  "🐒 The Cheeky", "🗣️ The Banter", "🅱️ The Bitchin'", "👻 The Haunted", "🐺 The Howling",
]

ITEMS = [
  { name: "🍋 Lemons",              shout: "💬 Delicious!" },
  { name: "🥛 Old Milk",            shout: "💬 This milk is well out of date, meh, drink it anyway" },
  { name: "🥬 Egh! Kale",           shout: "🗯️ Egh! Kale!" },
  { name: "🍔 Mackie D's",          shout: "💬 Mackie D's! Fucking A!" },
  { name: "🍟 Cold Chips",          shout: "💬 there's chips on the floor, 5 second rule!" },
  { name: "🍕 Trash Pizza",         shout: "💬 Ha! What idiot left this pizza here!" },
  { name: "🍩 Stale Donut",         shout: "💬 this got flies on it, fuck it" },
  { name: "🎂 Fucking Cake",        shout: "💬 Holy shit! A fucking cake!" },
  { name: "🍌 Mouldy Bananas",      shout: "💬 These mouldy bananas will have to do" },
  { name: "☕ Instant Coffee",      shout: "💬 I prefer instant!" },
  { name: "🥞 Burnt Pancakes",      shout: "💬 I'll still eat these" },
  { name: "🌿 Northern Lights",     shout: "💬 Sweet as!" },
  { name: "🌭 Tinned Hot Dogs",     shout: "💬 Dinner Sorted!" },
  { name: "🔷 Heisenberg's Blue",   shout: "💬 WHHOA! River Dance!" },
  { name: "🥟 Questionnable Taco",  shout: "💬 Who left this 'ere?" },
  { name: "🌶️ Really Spicy Pepper", shout: "💬 This chilli p will give me the quick energy I need!" },
  { name: "🍗 Undercooked Chicken", shout: "💬 Shoulda cooked this first, hungry tho" },
]
