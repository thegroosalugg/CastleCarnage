# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def health_trap(entity)
  operator = rand(2) # Operator decides (+) or (-) Randomizer nerfed for player trap & enemy health gain
  randomizer = (entity[:id] == :player && operator == 1) || (entity[:id] == :enemy && operator == 0) ? rand(10..20) : (rand(1..5) == 1 ? rand(50..99) : rand(20..50))
  operator == 0 ? entity[:hp] += randomizer : entity[:hp] -= randomizer
  gifts(entity, operator, randomizer)
end

def explore_rooms(enemies, player)
  choice = 0
  chosen_rooms = room_vault
  player[:land] = { id: :room, art: ROOM_SERVICE.sample }
  state_of_game(enemies, player)

  until (4..7).include?(choice) # index +4 / -4 to set user choice to (4..7) instead of (0..3)
    puts MENU_HEADER
    chosen_rooms.each_with_index { |room, i| puts " " * 22 + "#{ML}#{NUM[i + 4]}#{CL} #{room[:name]}" }
    puts BARRIER

    choice = gets.chomp.to_i
    error(:input) unless (4..7).include?(choice)
    state_of_game(enemies, player) unless (4..7).include?(choice)
  end

  print `clear`
  entered_room = chosen_rooms[choice - 4]
  enter_room(entered_room)
  gift = entered_room[:chance].sample

  case gift
  when 1
    health_trap([player, enemies.sample].sample) # choose a random enemy and then sample enemy & player
  when 2
    rand(2) == 1 ? equip_weapon(enemies.sample) : equip_weapon(player)
  when 3 # New enemy spawns in empty slot
    if enemies.length < 4
      enemies << random_enemy
      enemy_speaks(enemies[-1], :summon)
    else
      equip_weapon(player)
    end
  end
end
