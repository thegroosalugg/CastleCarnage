# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def escape_room(enemies, player)
  choice = 0
  rooms = room_vault
  player[:land] = { id: :room, art: ROOM_SERVICE.sample }
  shout(player, :escape)
  game_info(enemies, player)

  until (4..7).include?(choice) # index +4 / -4 to set user choice to (4..7) instead of (0..3)
    puts MENU_HEADER
    rooms.each_with_index { |room, i| puts " " * 22 + "#{ML}#{NUM[i + 4]}#{CL} #{room[:name]}" }
    puts BARRIER

    choice = gets.chomp.to_i
    shout(player, :error)    unless (4..7).include?(choice)
    game_info(enemies, player) unless (4..7).include?(choice)
  end

  print `clear`
  player[:room] = rooms[choice - 4]
  player[:rooms] += 1
  player[:roll] = player[:room][:chance].sample
  target = [player, enemies.sample].sample
  shout(player, :room)

  case player[:roll]
  when 1 then crap_factory(target)
  when 2 then weapon_wakes(target)
  when 3 # New enemy spawns in empty slot
    if enemies.length < 5
      enemies << random_enemy
      shout(enemies[-1], :summon)
    else
      weapon_wakes(player)
    end
  end
  surprise(enemies, player)
end
