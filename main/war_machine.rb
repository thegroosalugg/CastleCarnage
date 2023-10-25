# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# When you see the player being passed as a parameter twice, the second instance is to check their level
# All content must scale to the player's level, but the first parameter must be for the recepient, such as the enemy

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
    beers:    0,
    kills:    0,
    scout:    0,
    xp:       0,
    level:    0,
    boosts:   []
  }
end

def random_enemy(player)
  enemy = {
    id:     :enemy,
    name:   "#{YL}#{ENEMIES.sample}#{CL}",
    hp:     (rand(30..50) + rand(0..player[:kills])), # stats need to scale with player level
    attack: (rand(8..15)  + rand(0..player[:level])),
    block:  (rand(1..6)   + rand(0..player[:level])),
    aim:    rand(6..9),
    chance: rand(2..5),
    crit:   rand(1.5..2.5).round(1),
  }
end

def spawn_enemy(enemies, player)
  if enemies.length < 4
    enemies << random_enemy(player)
    shout(enemies[-1], :summon)
  else rand(2) == 1 ? weapon_wakes(player, player) : crap_factory(player)
  end             # chance 3 has same outcome as 1 or 2 when enemies full
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
                          # player now a paraameter everywhere to check their level and scale stats of everything else
def weapon_wakes(wielder, player, order = nil)
  regular = ["#{YL}#{WEAPONS.sample}", 2..5, 10..20, 2..6,  6..9,   2..4, 1.6..2.0]
  special = ["#{MG}#{SPECIAL.sample}", 3..5, 15..25, 4..10, 6..10,  2..5, 2.0..2.5]
                                 name, uses, attack, block,   aim, chance, crit = order == :bonus || rand(4) == 1 ? special : regular
  bonus   = order == :bonus || rand(2) == 1 ? [:somersault, :gambler, :stylish, :sneaky, :psychic].sample : ""

  weapon = {
    name:  "#{name}#{CL}",
    uses:   rand(uses),
    attack: (rand(attack) + rand(0..player[:level])),
    block:  (rand(block)  + rand(0..player[:level])),
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

def crap_factory(wielder, order = nil)
  x  = order        == :bonus  ?   1 : -1 # default items can be positive or negative, pure-positive can be bought
  hp = wielder[:id] == :player ?  10 :  5 # nerf enemy hp gain
  item = {
    name:  "#{GN}#{ITEMS.sample}#{CL}", # items are for offense only and do not nourish block
    hp:     rand(hp),
    attack: rand(1..5)              * [1, x].sample,
    aim:    rand(1..2)              * [1, x].sample,
    chance: rand(1..2)              * [1, x].sample,
    crit:   rand(0.3..0.5).round(1) * [1, x].sample,
  }

  wielder[:item] = item
  shout(wielder, :item)
end

def level_up(player)
  player[:xp]    = player[:kills] * 10 + player[:scout]
  player[:level] = (player[:xp] / 50).to_i

  if player[:level]         > player[:boosts].length # check which levels have been boosted
    player[:boost]          = [:attack, :block].sample
    player[:gains]          = player[:boost] == :attack ? 2 : 1 # all records stored as hash keys
    player[player[:boost]] += player[:gains] # less data to pass on, always updates without fail, easier to keep track of all at once
    player[:boosts]        << player[:level] # records and stores boosted level values
    shout(player, :level)
  end
end
