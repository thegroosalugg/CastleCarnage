# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

ENEMIES = [
  "👺 Goblin", "👹 Ogre", "👹 Orc", "🤪 Village Idiot", "👳 Village Elder", "👑 Village King",
  "🧙 Wizard", "🧝 Druid", "🐺 Werewolf", "🧛 Vampire", "🧟 Zombie", "🦖 Dinosaur", "🤖 Robot from the Future",
  "🐉 Dragon", "👻 Banshee", "🦹 Villain", "🦍 King Kong", "🐍 Snake", "🦖 T-Rex", "🦑 Squid", "🦂 Giant Scorpion",
]

BOSSES = [
  "💍 Lord of the Rings", "🧀 The Big Cheese", "🧥 The Godfather", "🚃 The Trailer Park Supervisor", "🤖 The Terminator", "😎 Dawsons Creek",
]

WEAPONS = [
  "🏏 Baseball Bat", "🥊 Punching Glove", "🪓 Axe", "🪒 Occam's Razor", "🗡 Dagger", "🗡️ Sword", "🎇 Mace", "🍢 Giant Club",
  "🛠️ Wrench", "🪄 Magic Scepter", "🏹 Crossbow", "🪚 Chainsaw", "🔫 Revolver", "🪃 Boomerang", "⚔️ Battle Axe", "🪓 Hatchet", "🧨 Dynamite",
]

SPECIAL_WEAPONS = [
  "🔫 Gatling Laser",  "🚀 Rocket Launcher", "🔥 Fireball", "💣 Bobomb", "🛫 Air Strike", "🦄 Unicorn", "🔥🐲 Charizard", "📓 Necronomicon",
]

ROOMS = [
  "🖼 The Secret Door Behind the Painting", "🚇 The Abandoned Underground Tunnels", "🕳 The Trapdoor Under the Carpet", "❓ The Super Secret Mystery Room",
  "🍽 The High Society Dining Room", "💡 The Glowing Light Room", "🕋 The Buzzin' Nightclub", "🏴 The Treasure Chamber", "🛁 The Manky Bathroom",
  "🛌 The Master Bedroom", "🔲 The Wobbly Window", "📚 The Musty Library", "📺 The Fancy Lounge", "😱 The Dodgy Cellar", "🩲 The Jacuzzi Room",
  "🚓 Dracula's Royce", "🏰 The Roof",
]

def random_enemy
  enemy = {
    name: ENEMIES.sample,
    hp: rand(200..400),
    attack: (rand(20..30)..rand(31..60)).to_a,
    block: (rand(1..5)..rand(6..15)).to_a,
    accuracy: (1..rand(5..11)).to_a,
    crit_ch: (1..rand(5..11)).to_a,
    crit_x: -> { rand(rand(1.5..2.0)..rand(2.0..4.0)) }
  }
end

def big_boss_awaits
  boss = {
    name: BOSSES.sample,
    hp: rand(600..1000),
    attack: (rand(20..50)..rand(51..90)).to_a,
    style: ["🍻 Barkeep", "🕶️ Bouncer"]
  }
end

def pick_weapon
  weapon = {
    name: WEAPONS.sample,
    durability: rand(1..5),
    attack: (rand(20..30)..rand(31..60)).to_a,
    accuracy: (1..rand(5..11)).to_a,
    crit_ch: (1..rand(5..11)).to_a,
    crit_x: -> { rand(rand(1.5..2.5)..rand(2.6..5.0)) }
  }
end

def special_weapon
  special_weapon = {
    name: SPECIAL_WEAPONS.sample,
    durability: rand(1..2),
    attack: (rand(30..40)..rand(41..100)).to_a,
    accuracy: (1..rand(6..12)).to_a,
    crit_ch: (1..rand(6..12)).to_a,
    crit_x: -> { rand(rand(2.0..3.0)..rand(3.1..5.0)) }
  }
end

def room_vault
  chosen_rooms = []

  while chosen_rooms.length < 4
    room = {
      name: ROOMS.sample,
      chance: Array.new(rand(4..12)) { rand(1..7) } # creates an array with 4-12 integers, each with a value between 1 and 7
    }
    
    # Check if the generated room's name is unique within the chosen_rooms array
    unless chosen_rooms.any? { |chosen_room| chosen_room[:name] == room[:name] }
      chosen_rooms << room
    end
  end

  chosen_rooms
end
