# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def health_trap(entity)
  operator = rand(2) # Operator decides (+) or (-) Randomizer nerfed for player trap & enemy health gain
  randomizer = (entity[:id] == :player && operator == 1) || (entity[:id] == :enemy && operator == 0) ? rand(10..20) : (rand(1..5) == 1 ? rand(50..99) : rand(20..50))
  operator == 0 ? entity[:hp] += randomizer : entity[:hp] -= randomizer
  gifts(entity, operator, randomizer)
end

def explore_rooms(enemies, weapon, player, load_art)
  user_choice = 0
  chosen_rooms = room_vault

  until (4..7).include?(user_choice) # index +4 / -4 to set user choice to (4..7) instead of (0..3)
    chosen_rooms.each_with_index { |room, i| puts "    [#{i + 4}] #{room[:name]}" }

    user_choice = gets.chomp.to_i
    error_message unless (4..7).include?(user_choice)
    state_of_game(enemies, player, weapon, load_art)
  end

  print `clear`
  entered_room = chosen_rooms[user_choice - 4]
  enter_room(entered_room)
  gift = entered_room[:chance].sample

  case gift
  when 1
    health_trap([player, enemies.sample].sample) # choose a random enemy and then sample enemy & player
  when 2 # Get a new weapon; 20% for special weapon
    weapon = rand(1..5) == 1 ? special_weapon : pick_weapon
    weapon_speaks(weapon, :got)
  when 3 # New enemy spawns in empty slot
    if enemies.length < 4
      enemies << random_enemy
      enemy_speaks(enemies[-1], :summon)
    else
      weapon = rand(1..4) == 1 ? special_weapon : pick_weapon
      weapon_speaks(weapon, :got)
    end
  end
  return enemies, weapon
end
