# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def wake_up
  player = {
    id: :player,
    hp:     100,
    attack:  10,
    block:    2,
    accuracy: 7,
    crit_ch:  2,
    crit_x: 1.5,
    cash:     0,
    drunk:    0,
    kills:    0,
    rooms:    0,
  }
end

def random_enemy
  enemy = {
    id:       :enemy,
    name:     "#{YL}#{ENEMIES.sample}#{CL}",
    hp:       rand(50..80),
    attack:   rand(8..15),
    block:    rand(1..6),
    accuracy: rand(5..8),
    crit_ch:  rand(5..8),
    crit_x:   rand(1.5..2.5),
  }
end

def crap_factory(enemies, player)
  buffs = [:hp, :xattack, :xblock, :xaccuracy, :xcrit_ch]
  target = [player, enemies.sample].sample
  buff = buffs.sample

  target[buff] ||= 0  # Initialize the key if it doesn't exist, then accumulate the boost
  boost = (rand(1..2) * [1, -1].sample)
  gains = boost.positive? ? :item : :trap # set outcome
  target[buff] += boost # apply boost

  if buff == :hp
    invoice(target, buff, gains)
  else
    invoice(target, buff, gains)
  end
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
  regular = ["#{YL}#{WEAPONS.sample}", 2..5,  10..20,  2..6,     5..9,     2..3,  1.5..2.0]
  special = ["#{MG}#{SPECIAL.sample}", 3..5,  15..25,  4..10,    5..10,    2..4,  2.0..2.5]
                                 name, uses,  attack,  block,  accuracy, crit_ch,   crit_x = rand(4) == 1 ? special : regular

  weapon = {
    name:    "#{name}#{CL}",
    uses:     rand(uses),
    attack:   rand(attack),
    block:    rand(block),
    accuracy: rand(accuracy),
    crit_ch:  rand(crit_ch),
    crit_x:   rand(crit_x)
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
