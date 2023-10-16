# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def wake_up
  player = {
    id: :player,
    hp: 150,
    attack: 10,
    block: 2,
    accuracy: 5,
    crit_ch: 10,
    crit_x: 1.5,
    cash: 0,
    drunk: 0,
    kills: 0,
    rooms: 0
  }
end

def random_enemy
  enemy = {
    id: :enemy,
    name: "#{YL}#{ENEMIES.sample}#{CL}",
    hp: rand(60..99),
    attack: rand(8..20),
    block: rand(1..5),
    accuracy: rand(3..11),
    crit_ch: rand(3..11),
    crit_x: rand(1.5..2.5)
  }
end

# def big_boss_awaits
#   boss = {
#     id: :boss,
#     name: "#{OR}#{BOSSES.sample}#{CL}",
#     hp: 200,
#     attack: rand(8..20),
#     block: rand(2..10),
#     accuracy: rand(3..11),
#     crit_ch: rand(3..11),
#     crit_x: rand(2.0..2.5),
#     rage: 0,
#     style: [ :barkeep, :bouncer, :band ]
#   }
# end


# Method to pick a weapon
def pick_weapon
  weapon = {
    name: "#{YL}#{WEAPONS.sample}#{CL}",
    uses: rand(2..5),
    attack: rand(5..15),
    block: rand(1..8),
    accuracy: rand(-3..7),
    crit_ch: rand(-7..3),
    crit_x: rand(-0.2..1.5)
  }
end

# Method to equip a weapon to the wielder
def equip_weapon(wielder)
  wielder[:uses] = 0 if wielder[:equipped]
  weapon_breaks(wielder)
  weapon = pick_weapon
  wielder[:equipped] = weapon[:name]
  wielder[:uses] = weapon[:uses]
  wielder[:weapon_attack] = weapon[:attack]
  wielder[:weapon_block] = weapon[:block]
  wielder[:weapon_accuracy] = weapon[:accuracy]
  wielder[:weapon_crit_ch] = weapon[:crit_ch]
  wielder[:weapon_crit_x] = weapon[:crit_x]

  wielder[:attack] += wielder[:weapon_attack]
  wielder[:block] += wielder[:weapon_block]
  wielder[:accuracy] += wielder[:weapon_accuracy]
  wielder[:crit_ch] += wielder[:weapon_crit_ch]
  wielder[:crit_x] += wielder[:weapon_crit_x]
end

# Method to handle when the weapon breaks
def weapon_breaks(wielder)
  if wielder[:uses] == 0
    weapon_speaks(wielder[:equipped], :broke)

    wielder[:attack] -= wielder[:weapon_attack]
    wielder[:block] -= wielder[:weapon_block]
    wielder[:accuracy] -= wielder[:weapon_accuracy]
    wielder[:crit_ch] -= wielder[:weapon_crit_ch]
    wielder[:crit_x] -= wielder[:weapon_crit_x]

    wielder[:weapon_attack] = 0
    wielder[:weapon_block] = 0
    wielder[:weapon_accuracy] = 0
    wielder[:weapon_crit_ch] = 0
    wielder[:weapon_crit_x] = 0

    wielder[:equipped] = nil
  end
end

# def special_weapon
#   special_weapon = {
#     id: :special_weapon,
#     name: "#{OR}#{SPECIAL_WEAPONS.sample}#{CL}",
#     durability: rand(2..3),
#     broken: false,
#     attack: rand(10..25),
#     accuracy: rand(1..3),
#     crit_ch: rand(1..3),
#     crit_x: rand(0.5..1.5)
#   }
# end

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
