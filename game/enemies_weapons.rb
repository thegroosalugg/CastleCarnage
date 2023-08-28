# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def random_enemy
  enemies = [
    { name: "Goblin 😈", hp: rand(20..30), attack: (5..10).to_a, block: (1..5).to_a },
    { name: "Goblin Horde 👺👺👺", hp: rand(60..90), attack: (15..25).to_a, block: (3..15).to_a },
    { name: "Orc 👹", hp: rand(30..40), attack: (8..12).to_a, block: (2..7).to_a },
    { name: "Village Idiot 🤪", hp: rand(10..20), attack: (5..10).to_a, block: (2..4).to_a },
    { name: "Village Elder 🧙‍♂️", hp: rand(40..50), attack: (10..15).to_a, block: (3..8).to_a },
    { name: "Village King 👑", hp: rand(70..100), attack: (20..30).to_a, block: (5..15).to_a },
    { name: "Wizard 🧙‍♂️", hp: rand(30..40), attack: (15..25).to_a, block: (2..10).to_a },
    { name: "Druid 🌿", hp: rand(40..50), attack: (10..20).to_a, block: (3..8).to_a },
    { name: "Werewolf 🐺", hp: rand(40..50), attack: (12..18).to_a, block: (3..8).to_a },
    { name: "Werewolf Horde 🐺🐺🐺", hp: rand(80..120), attack: (25..40).to_a, block: (6..18).to_a },
    { name: "Robot from the future 🤖", hp: rand(60..80), attack: (18..25).to_a, block: (5..15).to_a },
    { name: "Dragon 🐉", hp: rand(100..150), attack: (30..50).to_a, block: (10..25).to_a },
  ]

  enemies.sample
end

def pick_weapon
  weapons = [
    { name: "Baseball Bat 🏏", damage: (5..10).to_a, durability: rand(2..3) },
    { name: "Punching Glove 🥊", damage: (3..7).to_a, durability: rand(2..3) },
    { name: "Axe 🪓", damage: (8..15).to_a, durability: rand(3..4) },
    { name: "Dagger 🗡", damage: (10..18).to_a, durability: rand(3..4) },
    { name: "Sword 🗡️", damage: (15..25).to_a, durability: rand(3..4) },
    { name: "Magic Scepter ✨", damage: (10..20).to_a, durability: rand(3..4) },
    { name: "Fireball 🔥", damage: (20..30).to_a, durability: 1 },
    { name: "Mace ⚒️", damage: (10..18).to_a, durability: rand(2..5) },
    { name: "Giant Club 🍢", damage: (20..35).to_a, durability: rand(3..6) },
    { name: "Long Bow 🏹", damage: (10..18).to_a, durability: rand(2..4) },
    { name: "Crossbow 🏹", damage: (12..20).to_a, durability: rand(2..4) },
    { name: "Gatling Laser 🔫", damage: (25..40).to_a, durability: rand(5..8) },
  ]

  weapons.sample
end
