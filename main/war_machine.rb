# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def wake_up
  player = {
    id: :player,
    hp:     100,
    attack:  10,
    block:    2,
    accuracy: 8,
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
    block:    rand(1..5),
    accuracy: rand(5..8),
    crit_ch:  rand(5..8),
    crit_x:   rand(1.5..2.5),
  }
end

def crap_factory(enemies, player)
  buffs = [:hp, :xattack, :xblock, :xaccuracy, :xcrit_ch]
  target = [player, enemies.sample].sample
  buff = buffs,sample

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
                                          # ANSI color hard coded here or all rooms get same color
  chosen_rooms.map { |room| room[:name] = "\e[3#{rand(1..6)}m#{DESC.sample} #{room[:name]}#{CL}" } # Give the rooms a unique desc
  chosen_rooms
end

# Method to create a weapon
def pick_weapon
  regular = ["#{YL}#{WEAPONS.sample}", 2, 5, 1, 5, -5, -0.3]
  special = ["#{MG}#{SPECIAL.sample}", 3, 10, 4, 7, -7, 0.0]
  name, us, at, bk, ac, ch, x = rand(4) == 1 ? special : regular

  weapon = {
    name:    "#{name}#{CL}",
    uses:     rand(us..5),
    attack:   rand(at..15),
    block:    rand(bk..5),
    accuracy: rand(ac..5),
    crit_ch:  rand(ch..5),
    crit_x:   rand(x..1.5)
  }
end

def adjust_stats(wielder, request, weapon = nil) # takes player/enemy & saves weapon stats as new keys
  preset = [       :attack,        :block,        :accuracy,        :crit_ch,        :crit_x] # based on request saved stats are added or removed and reset
  boost  = [:weapon_attack, :weapon_block, :weapon_accuracy, :weapon_crit_ch, :weapon_crit_x]

  preset.each_with_index do |stat, i1|
    boost.each_with_index do |boost, i2|
      if i1 == i2
        if request == :add
          wielder[boost]  =  weapon[stat ]
          wielder[stat ] += wielder[boost]
        else
          wielder[stat ] -= wielder[boost]
          wielder[boost]  = 0
        end
      end
    end
  end
end

def equip_weapon(wielder)
  if wielder[:equipped] # first thing check for and destroy existing weapon
    wielder[:uses] = 0
    weapon_breaks(wielder)
  end
  weapon = pick_weapon # create weapon and assign to player
  wielder[:equipped] = weapon[:name]
  wielder[:uses    ] = weapon[:uses]

  adjust_stats(wielder, :add, weapon) # saves weapon stats as new keys and adds them to player stats
  weapon_speaks(wielder, wielder[:equipped], (wielder[:id] == :player ? :got : :enemy)) # decides whose message plays
end

def weapon_breaks(wielder)
  if wielder[:uses] == 0
    weapon_speaks(wielder, wielder[:equipped], :broke) if wielder[:id] == :player # don't care about enemy weapons breaking
    adjust_stats(wielder, :remove) # no weapon required to remove weapon stats, we use newly created keys to change values back
    wielder[:equipped] = nil # delete weapon
  end
end
