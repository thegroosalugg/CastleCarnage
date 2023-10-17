# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies)
  case player[:choice]
  when 'e' then enemies.first[:hp] -= 100
  when 's' then enemies << random_enemy
  when "h" then player[:hp] -= 100
  when "j" then player[:hp] += 100
  when "v" then player[:cash] -= 1
  when "c" then player[:cash] += 1
  when "f" then player[:drunk] -= 1
  when "d" then player[:drunk] += 1
  when "w" then player[:uses] += 1 if player[:equipped]
  when "q" then player[:uses] -= 1 if player[:equipped]
  when "3" then player[:uses]  = 0 if player[:equipped]
  when "2" then equip_weapon(player)
  when "4" then equip_weapon(enemies.sample)
  when "1" then weapon_breaks(player)
  end
  print `clear`
  player[:uses] = player[:uses].clamp(0, 5) if player[:equipped]
  player[:drunk] = player[:drunk].clamp(0, 5)
  player[:cash] = player[:cash].clamp(0, 5)
  return enemies
end
