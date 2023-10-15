# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def random_enemy
  enemy = {        # \e[31m Text \e[0m  assigns a text color. values 1-8 represent different colors
    id: :enemy,    # rand(1..6) assigns a random color as all codes are the same in ranges 1..7. 7 is white (default)
    name: "\e[33m#{ENEMIES.sample}\e[0m",
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
    name: "\e[35m#{BOSSES.sample}\e[0m",
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
    name: "\e[36m#{WEAPONS.sample}\e[0m",
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
