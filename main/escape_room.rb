# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def escape_room(enemies, player)
  choice          = 0
  n               = (6 - player[:drunk]).clamp(1, 4) # fewer rooms available if player drunk
  player[:rooms]  = room_vault(n) # creates n room
  player[:land]   = { id: :room, art: ROOM_SERVICE.sample } # sets the scene

  shout(player, :escape)
  game_info(enemies, player)

  until (4..(3 + player[:rooms].length)).include?(choice) # 4..(3 + rooms length are set to the indexes are 4-7 instead of 0-3
    puts MENU_HEADER
    player[:rooms].each_with_index { |room, i| puts " " * 22 + "#{ML}#{NUM[i + 4]}#{CL} #{room[:name]}" } # +4 to index
    puts BARRIER
    choice = gets.chomp.to_i

    shout(player, :error)      # unless (4..7).include?(choice)
    game_info(enemies, player) # unless (4..7).include?(choice)
  end

  print `clear`
  player[:room]   = player[:rooms][choice - 4] # -4 to correct index
  #p player[:rooms]
  player[:scout] += 1 # updates visited counter
  player[:drunk].times { player[:room][:chance] << 3 } # 1 extra chance to meet an enemy per level of drunk
  player[:roll]   = player[:room][:chance].sample # final outcome is then sampled
  p player[:room] # DEBUG
  shout(player, :room)

  case player[:roll]
  when 1 then crap_factory(player)
  when 2 then weapon_wakes(player)
  when 3 then spawn_enemy(enemies, player)
  end
  target          = [player, enemies.sample].sample
  surprise(enemies, player)
end
