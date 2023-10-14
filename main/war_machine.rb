# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ENEMIES = [
  "👺 Goblin", "👹 Ogre", "👾 Orc", "🧌 Troll", "🤷 Village Idiot", "👳 Village Elder", "🦞 The Crab", "🕷️ Hench Spider",
  "🧙 Wizard", "🧝 Druid", "🐺 Werewolf", "🧛 Vampire", "🧟 Zombie", "🦖 Dinosaur", "🤖 Robot from the Future",
  "🐉 Dragon", "👻 Banshee", "🦹 Arsehole", "🦍 King Kong", "🐍 Snake", "🦑 Bad Squid", "🦂 Giant Scorpion",
]

BOSSES = [
  "👑 Village King", "🧀 The Big Cheese", "🎩 The Don", "🧥 The Godfather", "🤵 The Manager", "🎭 The Master", "👤 The Supreme Overlord"
]

WEAPONS = [
  "🏏 Baseball Bat", "🥊 Punching Glove", "🔪 Switchblade", "🗡 Dagger", "🗡️ Sword", "🎇 Mace", "🍢 Giant Club", "🛠️ Wrench",
  "🪄 Magic Scepter", "🏹 Crossbow", "🪚 Chainsaw", "🔫 Revolver", "🪃 Boomerang", "⚔️ Battle Axe", "🪓 Hatchet", "🧨 Dynamite",
]

SPECIAL_WEAPONS = [
  "🪡 Gatling Laser", "🚀 Rocket Launcher", "🔥 Fireball", "💣 Bobomb", "🛫 Air Strike", "🪈 Magic Flute",
  "🦄 Unicorn", "🪔🐲 Charizard", "📓 Necronomicon",
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
  "💩 The Manky", "🗯 The Shoddy", "🧛 Dracula's", "🏢 The Swanky", "🐝 The Buzzing", "🍷 The Dodgy", "🩸 The Bloody",
  "🎉 The Reem", "🐴 The Pony", "🤬 The Bastard", "🤩 The Peng", "🤪 The Mental", "👹 The Wicked", "🎭 The Dramatic",
  "🎤 The Groovy", "🎃 The Spooky", "🚢 The Nautical", "🍔 The Greasy", "🌑 The Abandoned", "😵 The Bonkers", "🎸 The Rocking",
  "🍄 The Shroomy", "🦁 The Roaring", "🌵 The Deserted", "🤢 The Gnarly", "🏛️ The Presidential", "🔮 The Trippy", "🤮 The Minging",
  "🐒 The Cheeky", "🗣️ The Banter", "🅱️ The Bitchin'", "👻 The Haunted", "🐺 The Howling",
]

def random_enemy
  enemy = {        # \e[31m Text \e[0m  assigns a text color. values 1-8 represent different colors
    id: :enemy,    # rand(1..6) assigns a random color as all codes are the same in ranges 1..7. 7 is white (default)
    name: "\e[3#{rand(1..6)}m#{ENEMIES.sample}\e[0m",
    hp: rand(60..90),
    attack: (rand(20..30)..rand(31..40)),
    block: (rand(1..5)..rand(6..12)),
    accuracy: (1..rand(4..11)),
    crit_ch: (1..rand(4..11)),
    crit_x: (rand(1.5..2.0)..rand(2.1..3.5))
  }
end

def big_boss_awaits
  boss = {
    id: :boss,
    name: "\e[3#{rand(1..6)}m#{BOSSES.sample}\e[0m",
    hp: rand(580..650),
    attack: (rand(30..40)..rand(41..50)),
    accuracy: (1..rand(4..10)),
    rage: 0,
    style: ["🍻 Barkeep", "🕶️ Bouncer", "🎶 Band"]
  }
end

def pick_weapon
  weapon = {
    id: :weapon,
    name: "\e[3#{rand(1..6)}m#{WEAPONS.sample}\e[0m",
    durability: rand(2..5),
    broken: false,
    attack: (rand(20..30)..rand(31..60)),
    accuracy: (1..rand(4..11)),
    crit_ch: (1..rand(4..11)),
    crit_x: (rand(1.5..2.5)..rand(2.6..5.0))
  }
end

def special_weapon
  special_weapon = {
    id: :special_weapon,
    name: "\e[38;5;208m#{SPECIAL_WEAPONS.sample}\e[0m",
    durability: rand(2..3),
    attack: (rand(30..40)..rand(41..99)),
    accuracy: (1..rand(5..12)),
    crit_ch: (1..rand(5..8)),
    crit_x: (rand(2.0..3.0)..rand(3.1..5.0))
  }
end

def room_vault
  chosen_rooms = []

  while chosen_rooms.length < 4
    room = {
      name: ROOMS.sample,
      chance: Array.new(rand(4..12)) { rand(1..3) } # creates an array with 4-12 integers, each with a value between 0-6
    }

    # Check if the generated room's name is unique within the chosen_rooms array
    unless chosen_rooms.any? { |chosen_room| chosen_room[:name] == room[:name] }
      chosen_rooms << room
    end
  end

  chosen_rooms.map { |room| room[:name] = "\e[3#{rand(1..7)}m#{DESC.sample} #{room[:name]}\e[0m" } # Give the rooms a unique desc
  chosen_rooms
end
