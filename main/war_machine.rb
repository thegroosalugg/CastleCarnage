# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ENEMIES = [
  "👺 Goblin", "👹 Ogre", "👾 Orc", "🤪 Village Idiot", "👳 Village Elder", "👑 Village King", "🦀 Milelurk",
  "🧙 Wizard", "🧝 Druid", "🐺 Werewolf", "🧛 Vampire", "🧟 Zombie", "🦖 Dinosaur", "🤖 Robot from the Future",
  "🐉 Dragon", "👻 Banshee", "🦹 Arsehole", "🦍 King Kong", "🐍 Snake", "🦑 Crazy Squid", "🦂 Giant Scorpion",
]

BOSSES = [
  "💍 Lord of the Rings", "🧀 The Big Cheese", "🧥 The Godfather", "🚃 The Trailer Park Supervisor", "🤖 The Terminator", "😎 Dawsons Creek",
]

WEAPONS = [
  "🏏 Baseball Bat", "🥊 Punching Glove", "🪓 Axe", "🔪 Switchblade", "🗡 Dagger", "🗡️ Sword", "🎇 Mace", "🍢 Giant Club", "🛠️ Wrench",
  "🪄 Magic Scepter", "🏹 Crossbow", "🪚 Chainsaw", "🔫 Revolver", "🪃 Boomerang", "⚔️ Battle Axe", "🪓 Hatchet", "🧨 Dynamite",
]

SPECIAL_WEAPONS = [
  "🔫 Gatling Laser", "🚀 Rocket Launcher", "🔥 Fireball", "💣 Bobomb", "🛫 Air Strike", "🦄 Unicorn", "🔥🐲 Charizard", "📓 Necronomicon",
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
  enemy = {
    id: "enemy",
    name: ENEMIES.sample,
    hp: rand(200..400),
    attack: (rand(20..30)..rand(31..60)).to_a,
    block: (rand(1..5)..rand(6..15)).to_a,
    accuracy: (1..rand(5..11)).to_a,
    crit_ch: (1..rand(5..11)).to_a,
    crit_x: -> { rand(rand(1.5..2.0)..rand(2.1..4.0)) }
  }
end

def big_boss_awaits
  boss = {
    id: "boss",
    name: BOSSES.sample,
    hp: rand(600..1000),
    attack: (rand(20..50)..rand(51..90)).to_a,
    style: ["🍻 Barkeep", "🕶️ Bouncer", "🚾 Toilet Guy"]
  }
end

def pick_weapon
  weapon = {
    id: "weapon",
    name: WEAPONS.sample,
    durability: rand(1..5),
    broken: false,
    attack: (rand(20..30)..rand(31..60)).to_a,
    accuracy: (1..rand(5..11)).to_a,
    crit_ch: (1..rand(5..11)).to_a,
    crit_x: -> { rand(rand(1.5..2.5)..rand(2.6..5.0)) }
  }
end

def special_weapon
  special_weapon = {
    id: "special weapon",
    name: SPECIAL_WEAPONS.sample,
    durability: rand(1..2),
    attack: (rand(30..40)..rand(41..100)).to_a,
    accuracy: (1..rand(6..12)).to_a,
    crit_ch: (1..rand(5..8)).to_a,
    crit_x: -> { rand(rand(2.0..3.0)..rand(3.1..5.0)) }
  }
end

def room_vault
  chosen_rooms = []

  while chosen_rooms.length < 4
    room = {
      name: ROOMS.sample,
      chance: Array.new(rand(4..12)) { rand(0..6) } # creates an array with 4-12 integers, each with a value between 1-7
    }

    # Check if the generated room's name is unique within the chosen_rooms array
    unless chosen_rooms.any? { |chosen_room| chosen_room[:name] == room[:name] }
      chosen_rooms << room
    end
  end

  chosen_rooms.map { |room| room[:name] = "#{DESC.sample} #{room[:name]}" } # Give the rooms a unique desc
  chosen_rooms
end
