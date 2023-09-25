# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# def random_enemy
#   enemies = [
#     { name: "👺 Goblin", hp: rand(180..200), attack: (20..30).to_a, block: (1..5).to_a, crit_ch: (1..8).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..9).to_a },
#     { name: "👹 Ogre", hp: rand(250..270), attack: (30..40).to_a, block: (3..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
#     { name: "👹 Orc", hp: rand(200..220), attack: (25..35).to_a, block: (2..7).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..10).to_a },
#     { name: "🤪 Village Idiot", hp: rand(150..170), attack: (15..25).to_a, block: (2..4).to_a, crit_ch: (1..6).to_a, crit_x: -> { rand(1.5..2.2) }, accuracy: (1..10).to_a },
#     { name: "👳 Village Elder", hp: rand(170..190), attack: (15..25).to_a, block: (3..8).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..11).to_a },
#     { name: "👑 Village King", hp: rand(190..210), attack: (20..35).to_a, block: (5..12).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..9).to_a },
#     { name: "🧙 Wizard", hp: rand(150..300), attack: (15..30).to_a, block: (1..15).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(1.5..5.0) }, accuracy: (1..8).to_a },
#     { name: "🌿 Druid", hp: rand(180..220), attack: (18..22).to_a, block: (3..8).to_a, crit_ch: (1..8).to_a, crit_x: -> { rand(1.8..2.2) }, accuracy: (1..10).to_a },
#     { name: "🐺 Werewolf", hp: rand(200..250), attack: (25..35).to_a, block: (8..10).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
#     { name: "🧛 Vampire", hp: rand(220..240), attack: (18..30).to_a, block: (5..8).to_a, crit_ch: (1..5).to_a, crit_x: -> { rand(2.5..3.0) }, accuracy: (1..11).to_a },
#     { name: "🧟 Zombie", hp: rand(150..180), attack: (15..35).to_a, block: (1..5).to_a, crit_ch: (1..5).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..8).to_a },
#     { name: "🦖 Dinosaur", hp: rand(220..280), attack: (20..40).to_a, block: (6..18).to_a, crit_ch: (1..15).to_a, crit_x: -> { rand(2.5..3.0) }, accuracy: (1..7).to_a },
#     { name: "🤖 Robot from the Future", hp: rand(180..220), attack: (20..30).to_a, block: (5..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..8).to_a },
#     { name: "🐉 Dragon", hp: rand(200..300), attack: (10..50).to_a, block: (1..20).to_a, crit_ch: (1..20).to_a, crit_x: -> { rand(3.5..5.0) }, accuracy: (1..6).to_a },
#     { name: "👻 Ghost", hp: rand(180..250), attack: (25..30).to_a, block: (3..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
#   ]

#   enemies.sample
# end

# def pick_weapon
#   weapons = [
#     { name: "🏏 Baseball Bat", attack: (25..40).to_a, durability: rand(2..5), crit_ch: (1..7).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..12).to_a },
#     { name: "🥊 Punching Glove", attack: (15..40).to_a, durability: rand(2..3), crit_ch: (1..5).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..10).to_a },
#     { name: "🪓 Axe", attack: (25..40).to_a, durability: rand(3..4), crit_ch: (1..8).to_a, crit_x: -> { rand(1.5..2.2) }, accuracy: (1..10).to_a },
#     { name: "🪒 Occam's Razor", attack: (15..35).to_a, durability: rand(1..3), crit_ch: (1..4).to_a, crit_x: -> { rand(2.0..4.0) }, accuracy: (1..8).to_a },
#     { name: "🗡 Dagger", attack: (10..45).to_a, durability: rand(1..4), crit_ch: (1..5).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..9).to_a },
#     { name: "🗡️ Sword", attack: (15..50).to_a, durability: rand(2..4), crit_ch: (1..10).to_a, crit_x: -> { rand(1.8..2.6) }, accuracy: (1..10).to_a },
#     { name: "🎇 Mace", attack: (16..48).to_a, durability: rand(2..5), crit_ch: (1..11).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
#     { name: "🍢 Giant Club", attack: (20..40).to_a, durability: rand(3..6), crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
#     { name: "🪄 Magic Scepter", attack: (10..60).to_a, durability: rand(1..4), crit_ch: (1..12).to_a, crit_x: -> { rand(2.0..5.0) }, accuracy: (1..7).to_a },
#     { name: "🏹 Long Bow", attack: (10..90).to_a, durability: rand(1..4), crit_ch: (1..8).to_a, crit_x: -> { rand(1.7..2.5) }, accuracy: (1..12).to_a },
#     { name: "🏹 Crossbow", attack: (20..80).to_a, durability: rand(1..3), crit_ch: (1..7).to_a, crit_x: -> { rand(1.6..2.3) }, accuracy: (1..11).to_a },
#   ]

#   weapons.sample
# end

# def special_weapon
#   special_weapons = [
#     { name: "🔫 Gatling Laser", attack: (25..60).to_a, durability: rand(3..4), crit_ch: (1..3).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..8).to_a },
#     { name: "🔥 Fireball", attack: (40..80).to_a, durability: 1, crit_ch: (1..3).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..7).to_a },
#     { name: "💣 Bobomb", attack: (40..100).to_a, durability: 1, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..9).to_a },
#     { name: "🛫 Air Strike", attack: (50..120).to_a, durability: 1, crit_ch: (1..13).to_a, crit_x: -> { rand(3.6..5.2) }, accuracy: (1..9).to_a },
#     { name: "🦄 Unicorn", attack: (10..90).to_a, durability: rand(2..3), crit_ch: (1..6).to_a, crit_x: -> { rand(2.5..3.5) }, accuracy: (1..11).to_a },
#     { name: "🔥🐲 Charizard", attack: (90..120).to_a, durability: rand(1..3), crit_ch: (1..6).to_a, crit_x: -> { rand(2.5..3.5) }, accuracy: (1..3).to_a },
#   ]

#   special_weapons.sample
# end

# def big_boss_awaits
#   bosses = [
#     { name: "💍 Lord of the Rings", hp: rand(800..1000), attack: [10, 10, 15, 15, 20, 30, 40, 50, 50, 100], style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#     { name: "🧀 The Big Cheese", hp: rand(600..800), attack: (30..120).to_a, style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#     { name: "🧥 The Godfather", hp: rand(700..900), attack: (50..60).to_a, style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#     { name: "🚃 The Trailer Park Supervisor", hp: rand(400..600), attack: (40..100).to_a, style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#     { name: "🤖 The Terminator", hp: rand(800..1000), attack: (30..80).to_a, style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#     { name: "😎 Dawsons Creek", hp: rand(600..800), attack: (40..70).to_a, style: ["🍻 Barkeep", "🕶️ Bouncer"] },
#   ]

#   bosses.sample
# end

ENEMY_NAMES = [
  "👺 Goblin", "👹 Ogre", "👹 Orc", "🤪 Village Idiot", "👳 Village Elder", "👑 Village King",
  "🧙 Wizard", "🧝 Druid", "🐺 Werewolf", "🧛 Vampire", "🧟 Zombie", "🦖 Dinosaur", "🤖 Robot from the Future", "🐉 Dragon", "👻 Ghost",
  "🦹 Villain", "🦍 King Kong", "🐍 Snake", "🦖 T-Rex", "🦑 Squid", "🦂 Giant Scorpion",
]

WEAPON_NAMES = [
  "🏏 Baseball Bat", "🥊 Punching Glove", "🪓 Axe", "🪒 Occam's Razor", "🗡 Dagger", "🗡️ Sword", "🎇 Mace", "🍢 Giant Club",
  "🛠️ Wrench", "🪄 Magic Scepter", "🏹 Crossbow", "🪚 Chainsaw", "🔫 Revolver", "🪃 Boomerang", "⚔️ Battle Axe", "🪓 Hatchet", "🧨 Dynamite",
]

SPECIAL_WEAPON_NAMES = [
  "🔫 Gatling Laser",  "🚀 Rocket Launcher", "🔥 Fireball", "💣 Bobomb", "🛫 Air Strike", "🦄 Unicorn", "🔥🐲 Charizard", "📓 Necronomicon",
]

BOSS_NAMES = [
  "💍 Lord of the Rings", "🧀 The Big Cheese", "🧥 The Godfather", "🚃 The Trailer Park Supervisor", "🤖 The Terminator", "😎 Dawsons Creek",
]

def random_enemy
  enemy = {
    name: ENEMY_NAMES.sample,
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
    name: BOSS_NAMES.sample,
    hp: rand(600..1000),
    attack: (rand(20..50)..rand(51..90)).to_a,
    style: ["🍻 Barkeep", "🕶️ Bouncer"]
  }
end

def pick_weapon
  weapon = {
    name: WEAPON_NAMES.sample,
    durability: rand(1..5),
    attack: (rand(20..30)..rand(31..60)).to_a,
    accuracy: (1..rand(5..11)).to_a,
    crit_ch: (1..rand(5..11)).to_a,
    crit_x: -> { rand(rand(1.5..2.5)..rand(2.6..5.0)) }
  }
end

def special_weapon
  special_weapon = {
    name: SPECIAL_WEAPON_NAMES.sample,
    durability: rand(1..2),
    attack: (rand(30..40)..rand(41..100)).to_a,
    accuracy: (1..rand(6..12)).to_a,
    crit_ch: (1..rand(6..12)).to_a,
    crit_x: -> { rand(rand(2.0..3.0)..rand(3.1..5.0)) }
  }
end
