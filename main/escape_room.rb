# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def escape_room(enemies, player)
  run_away(player)

  until (4..(3 + player[:rooms].length)).include?(player[:choice]) # 4..(3 + rooms length are set to the indexes are 4-7 instead of 0-3
    game_info(enemies, player)
    puts MENU_HEADER
    player[:rooms].each_with_index { |room, i| puts " " * 22 + "#{ML}#{NUM[i + 4]}#{CL} #{room[:name]}" } # +4 to index
    puts BARRIER
    player[:choice] = gets.chomp.to_i
    shout(player, :error)
  end

  print `clear`
  open_door(player)

  case player[:roll]
  when 1 then crap_factory(player)
  when 2 then weapon_wakes(player, player) # second player is for content level scaling
  when 3 then spawn_enemy(enemies, player)
  end
  parting_gift(enemies, player)
end

def run_away(player)
  player[:choice] = 0
               n  = (6 - player[:beers]).clamp(1, 4) # fewer rooms available if player drunk
  player[:rooms]  = room_vault(n) # creates n rooms
  player[:land]   = { id: :room, offset: 22, art:  "#{YL}#{THE_DOOR.sample}#{CL}" } # sets the scene
  shout(player, :escape)
end

def open_door(player)
  player[:room] = player[:rooms][player[:choice] - 4] # -4 to correct index
  player[:xp]  += 1
  player[:beers].times { player[:room][:chance] << 3 } # 1 extra chance to meet an enemy per beer
  player[:roll] = player[:room][:chance].sample # final outcome is then sampled
  shout(player, :room)
end

def parting_gift(enemies, player)
  if rand(2) == 1 # 50% player gets beer
    player[:beers] = (player[:beers] + 1).clamp(0, 5)
    shout(player, :beers)
  end
  if rand(2) == 1 # 50% for enemy to get item or weapon
    rand(2) == 1 ? crap_factory(enemies.sample) : weapon_wakes(enemies.sample, player)
  end
  surprise(enemies, player) unless (player[:weapon] && player[:weapon][:bonus] == :sneaky) # sneaky prevents surprise attacks
  player[:land]  = { id: :room, offset: 10, art: "#{ML}#{ROOM_SERVICE.sample}#{CL}" } # sets the scene
  player[:drain] = false
  player[:shop]  = false #  shop is disabled each round whether accessed or not
end
