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
  { name: "🥛 Old Milk",            shout: "💬 Meh! Drink it anyway" },
  { name: "🥬 Egh! Kale",           shout: "🗯️ Egh! Kale!" },
  { name: "🍔 Mackie D's",          shout: "💬 Fucking A!" },
  { name: "🍟 Cold Chips",          shout: "💬 What idiot left this here!" },
  { name: "🍕 Floor Pizza",         shout: "💬 5 second rule!" },
  { name: "🍩 Stale Donut",         shout: "💬 Fuck it" },
  { name: "🎂 Fucking Cake",        shout: "💬 Holy shit! A fucking cake!" },
  { name: "🍌 Mouldy Bananas",      shout: "💬 These will have to do" },
  { name: "☕ Instant Coffee",      shout: "💬 I prefer instant!" },
  { name: "🥞 Burnt Pancakes",      shout: "💬 I'll still eat these" },
  { name: "🌿 Northern Lights",     shout: "💬 Sweet as!" },
  { name: "🌭 Tinned Hot Dogs",     shout: "💬 Dinner sorted!" },
  { name: "🔷 Heisenberg's Blue",   shout: "💬 No way! Is it back?" },
  { name: "🥟 Questionnable Taco",  shout: "💬 Who left this 'ere?" },
  { name: "🌶️ Really Spicy Pepper", shout: "💬 These will do!" },
  { name: "🍗 Undercooked Chicken", shout: "💬 Too hungry to care" },
]
