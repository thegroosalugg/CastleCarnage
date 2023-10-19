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
def equip_weapon(wielder)
  regular = ["#{YL}#{WEAPONS.sample}", 2..5,  10..20,  2..6,  5..9,   2..3,  1.5..2.0]
  special = ["#{MG}#{SPECIAL.sample}", 3..5,  15..25,  4..10, 5..10,  2..4,  2.0..2.5]
                                 name, uses,  attack,  block,  aim, chance,  crit = rand(4) == 1 ? special : regular

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
  weapon_speaks(wielder, wielder[:weapon][:name], (wielder[:id] == :player ? :got : :enemy))
end

def weapon_breaks(wielder)
  wielder[:weapon][:uses] = (wielder[:weapon][:uses] - 1)
  if wielder[:weapon][:uses] == 0
    weapon_speaks(wielder, wielder[:weapon][:name], :broke) if wielder[:id] == :player # don't care about enemy weapons breaking
    wielder[:weapon] = nil # delete weapon
  end
end

def crap_factory()
  item = {
    name:  "#{name}#{CL}",
    uses:   rand(uses),
    attack: rand(attack),
    block:  rand(block),
    aim:    rand(aim),
    chance: rand(chance),
    crit:   rand(crit)
  }
end

def crap_factory(enemies, player)
  buff   = [:hp, :xattack, :xblock, :xaim, :xchance].sample
  target = [player,                  enemies.sample].sample

  if buff == :hp
    hp = rand(5..12) * [1, -1].sample
    invoice(target, hp, buff)
  else
    target[buff] ||= 0  # Initialize the key if it doesn't exist, then accumulate the boost
    boost = [1, -1].sample
    item  = boost.positive? ? :item : :trap # set outcome
    target[buff] += boost # apply boost
    invoice(target, buff, item)
  end
end
