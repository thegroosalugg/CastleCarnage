# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies, choice)
  case choice
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

# boss menu cheat interface. Not possible to combine the 2

def cheat_menu_boss(choice, player, buddy, weapon, the_boss, boss_style)
  case choice
  when "h"  then player[:hp] -= 100
  when "hh" then player[:hp] += 100
  when "w1" then weapon = pick_weapon
  when "w2" then weapon = special_weapon
  when "w"  then weapon[:durability] += 1
  when "ww" then weapon[:durability] -= 1
  when "b"  then the_boss[:hp] -= 200
  when "a"  then the_boss[:rage] += 1
  when "e"  then buddy[:hp] -= 100 if buddy
  when "ee" then buddy = random_enemy
  when "1"  then boss_style = :barkeep
  when "2"  then boss_style = :bouncer
  when "3"  then boss_style = :band
  when "v"  then player[:cash] -= 1
  when "c"  then player[:cash] += 1
  when "f"  then player[:drunk] -= 1
  when "d"  then player[:drunk] += 1
  end
  print `clear`
  weapon[:durability] = weapon[:durability].clamp(0, 10)
  player[:cash] = player[:cash].clamp(0, 20)
  player[:drunk] = player[:drunk].clamp(0, 20)
  return buddy, weapon, boss_style
end
