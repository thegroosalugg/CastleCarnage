# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def wake_up
  player = {
    id: :player,
    hp:     100,
    attack:  10,
    block:    2,
    aim:      7,
    chance:   2,
    crit:   1.5,
    cash:     0,
    drunk:    0,
    kills:    0,
    rooms:    0,
  }
end

def random_enemy
  enemy = {
    id:     :enemy,
    name:   "#{YL}#{ENEMIES.sample}#{CL}",
    hp:     rand(50..80),
    attack: rand(8..15),
    block:  rand(1..6),
    aim:    rand(5..8),
    chance: rand(5..8),
    crit:   rand(1.5..2.5),
  }
end

def room_vault
  rooms = []

  while rooms.length < 4
    room = {
      name: ROOMS.sample,
      chance: Array.new(rand(4..12)) { rand(1..3) } # creates an array with 4-12 integers, each with a value between 0-6
    }

    # Check if the generated room's name is unique within the rooms array
    unless rooms.any? { |decider| decider[:name] == room[:name] }
      rooms << room
    end
  end
                                          # ANSI color hard coded here or all rooms get same color
  rooms.map { |room| room[:name] = "\e[3#{rand(1..6)}m#{DESC.sample} #{room[:name]}#{CL}" } # Give the rooms a unique desc
  rooms
end

# Method to create a weapon
def weapon_wakes(wielder)
  regular = ["#{YL}#{WEAPONS.sample}", 2..5, 10..20, 2..6,  5..9,   2..3, 1.5..2.0]
  special = ["#{MG}#{SPECIAL.sample}", 3..5, 15..25, 4..10, 5..10,  2..4, 2.0..2.5]
                                 name, uses, attack, block,   aim, chance, crit = rand(4) == 1 ? special : regular

  weapon = {
    name:  "#{name}#{CL}",
    uses:   rand(uses),
    attack: rand(attack),
    block:  rand(block),
    aim:    rand(aim),
    chance: rand(chance),
    crit:   rand(crit)
  }

  wielder[:weapon] = weapon
  invoice(wielder, :got)
end

def weapon_breaks(wielder)
  wielder[:weapon][:uses] = (wielder[:weapon][:uses] - 1)
  if wielder[:weapon][:uses] == 0
    invoice(wielder, :broke)
    wielder[:weapon] = nil # delete weapon
  end
end

def crap_factory(wielder)
  item = {
    name:  "#{GN}#{ITEMS.sample}#{CL}",
    shout:     "#{SHOUTS.sample}",
    hp:     rand(2..8)     * [1, -1].sample,
    attack: rand(1..5)     * [1, -1].sample,
    block:  rand(1..3)     * [1, -1].sample,
    aim:    rand(1..2)     * [1, -1].sample,
    chance: rand(1..2)     * [1, -1].sample,
    crit:   rand(0.3..0.5) * [1, -1].sample,
  }

  wielder[:item] = item
  invoice(wielder, :item)
end
