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
    scout:    0,
  }
end

def random_enemy
  enemy = {
    id:     :enemy,
    name:   "#{YL}#{ENEMIES.sample}#{CL}",
    hp:     rand(30..50),
    attack: rand(8..15),
    block:  rand(1..6),
    aim:    rand(6..8),
    chance: rand(2..6),
    crit:   rand(1.5..2.5).round(1),
  }
end

def spawn_enemy(enemies, player)
  if enemies.length < 4
    enemies << random_enemy
    shout(enemies[-1], :summon)
  else
    weapon_wakes(player)
  end
end

def room_vault(n)
  rooms = []

  while rooms.length < n
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

def weapon_wakes(wielder)
  regular = ["#{YL}#{WEAPONS.sample}", 2..5, 10..20, 2..6,  6..9,   2..4, 1.6..2.0]
  special = ["#{MG}#{SPECIAL.sample}", 3..5, 15..25, 4..10, 6..10,  2..5, 2.0..2.5]
                                 name, uses, attack, block,   aim, chance, crit = rand(4) == 1 ? special : regular
  bonus   = rand(2) == 1 ? [:somersault, :gambler, :stylish, :psychic].sample : ""

  weapon = {
    name:  "#{name}#{CL}",
    uses:   rand(uses),
    attack: rand(attack),
    block:  rand(block),
    aim:    rand(aim),
    chance: rand(chance),
    crit:   rand(crit).round(1),
    bonus:  bonus
  }

  wielder[:weapon] = weapon
  shout(wielder, :got)
end

def weapon_breaks(wielder)
  wielder[:weapon][:uses] -= 1
  if wielder[:weapon][:uses] == 0
    shout(wielder, :broke)
    wielder[:weapon] = nil
  end
end

def crap_factory(wielder)
  item = {
    name:  "#{GN}#{ITEMS.sample}#{CL}", # items are for offense only and do not nourish block
    hp:     rand(2..8)              * [1, -1].sample,
    attack: rand(1..5)              * [1, -1].sample,
    aim:    rand(1..2)              * [1, -1].sample,
    chance: rand(1..2)              * [1, -1].sample,
    crit:   rand(0.3..0.5).round(1) * [1, -1].sample,
  }

  wielder[:item] = item
  shout(wielder, :item)
end
