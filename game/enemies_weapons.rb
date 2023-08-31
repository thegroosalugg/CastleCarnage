# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def random_enemy
  enemies = [
    { name: "👺 Goblin", hp: rand(180..200), attack: (20..30).to_a, block: (1..5).to_a, crit_ch: (1..8).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..9).to_a },
    { name: "👹 Ogre", hp: rand(250..270), attack: (30..40).to_a, block: (3..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
    { name: "👹 Orc", hp: rand(200..220), attack: (25..35).to_a, block: (2..7).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..10).to_a },
    { name: "🤪 Village Idiot", hp: rand(150..170), attack: (15..25).to_a, block: (2..4).to_a, crit_ch: (1..7).to_a, crit_x: -> { rand(1.5..2.2) }, accuracy: (1..10).to_a },
    { name: "👳‍♂️ Village Elder", hp: rand(170..190), attack: (15..25).to_a, block: (3..8).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..11).to_a },
    { name: "👑 Village King", hp: rand(200..250), attack: (20..35).to_a, block: (5..12).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..9).to_a },
    { name: "🧙‍♂️ Wizard", hp: rand(150..350), attack: (15..35).to_a, block: (1..15).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(1.5..5.0) }, accuracy: (1..8).to_a },
    { name: "🌿 Druid", hp: rand(180..220), attack: (18..22).to_a, block: (3..8).to_a, crit_ch: (1..8).to_a, crit_x: -> { rand(1.8..2.2) }, accuracy: (1..10).to_a },
    { name: "🐺 Werewolf", hp: rand(200..250), attack: (25..35).to_a, block: (8..10).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
    { name: "🧛‍♂️ Vampire", hp: rand(220..240), attack: (18..30).to_a, block: (5..8).to_a, crit_ch: (1..5).to_a, crit_x: -> { rand(2.5..3.0) }, accuracy: (1..11).to_a },
    { name: "🐺 Zombie", hp: rand(150..180), attack: (15..25).to_a, block: (1..5).to_a, crit_ch: (1..5).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..8).to_a },
    { name: "🦖 Dinosaur", hp: rand(220..280), attack: (20..40).to_a, block: (6..18).to_a, crit_ch: (1..15).to_a, crit_x: -> { rand(2.5..3.0) }, accuracy: (1..7).to_a },
    { name: "🤖 Robot from the Future", hp: rand(180..220), attack: (8..12).to_a, block: (5..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..8).to_a },
    { name: "🐉 Dragon", hp: rand(200..300), attack: (10..50).to_a, block: (1..20).to_a, crit_ch: (1..20).to_a, crit_x: -> { rand(3.5..5.0) }, accuracy: (1..6).to_a },
    { name: "👻 Ghost", hp: rand(180..250), attack: (25..30).to_a, block: (3..15).to_a, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
  ]

  enemies.sample
end

def pick_weapon
  weapons = [
    { name: "🏏 Baseball Bat", damage: (20..30).to_a, durability: rand(2..5), crit_ch: (1..7).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..12).to_a },
    { name: "🥊 Punching Glove", damage: (10..30).to_a, durability: rand(2..3), crit_ch: (1..5).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..10).to_a },
    { name: "🪓 Axe", damage: (25..40).to_a, durability: rand(3..4), crit_ch: (1..8).to_a, crit_x: -> { rand(1.5..2.2) }, accuracy: (1..10).to_a },
    { name: "🪒 Occam's Razor", damage: (15..35).to_a, durability: rand(1..3), crit_ch: (1..4).to_a, crit_x: -> { rand(2.0..4.0) }, accuracy: (1..8).to_a },
    { name: "🗡 Dagger", damage: (10..45).to_a, durability: rand(1..4), crit_ch: (1..5).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..9).to_a },
    { name: "🗡️ Sword", damage: (15..50).to_a, durability: rand(2..4), crit_ch: (1..10).to_a, crit_x: -> { rand(1.8..2.6) }, accuracy: (1..10).to_a },
    { name: "🎇 Mace", damage: (16..48).to_a, durability: rand(2..5), crit_ch: (1..11).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
    { name: "🍢 Giant Club", damage: (20..35).to_a, durability: rand(3..6), crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..10).to_a },
    { name: "✨ Magic Scepter", damage: (10..60).to_a, durability: rand(1..4), crit_ch: (1..12).to_a, crit_x: -> { rand(2.0..5.0) }, accuracy: (1..7).to_a },
    { name: "🏹 Long Bow", damage: (10..90).to_a, durability: rand(1..4), crit_ch: (1..8).to_a, crit_x: -> { rand(1.7..2.5) }, accuracy: (1..12).to_a },
    { name: "🏹 Crossbow", damage: (20..80).to_a, durability: rand(1..3), crit_ch: (1..7).to_a, crit_x: -> { rand(1.6..2.3) }, accuracy: (1..11).to_a },
  ]

  weapons.sample
end

def special_weapon
  special_weapons = [
    { name: "🔫 Gatling Laser", damage: (25..60).to_a, durability: rand(3..4), crit_ch: (1..3).to_a, crit_x: -> { rand(1.5..2.5) }, accuracy: (1..8).to_a },
    { name: "🔥 Fireball", damage: (40..80).to_a, durability: 1, crit_ch: (1..3).to_a, crit_x: -> { rand(2.0..2.5) }, accuracy: (1..7).to_a },
    { name: "💣 Bobomb", damage: (40..100).to_a, durability: 1, crit_ch: (1..10).to_a, crit_x: -> { rand(1.5..2.0) }, accuracy: (1..9).to_a },
    { name: "🛫 Air Strike", damage: (50..120).to_a, durability: 1, crit_ch: (1..9).to_a, crit_x: -> { rand(1.6..2.2) }, accuracy: (1..9).to_a },
    { name: "🦄 Unicorn", damage: (10..90).to_a, durability: rand(2..3), crit_ch: (1..6).to_a, crit_x: -> { rand(2.5..3.5) }, accuracy: (1..11).to_a },
  ]

  special_weapons.sample
end
