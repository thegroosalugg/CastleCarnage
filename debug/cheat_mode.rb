# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies, weapon, user_choice)
  case user_choice
  when 'e'  then enemies.first[:hp] -= 100
  when 'ee' then enemies << random_enemy
  when "h"  then player[:hp] -= 100
  when "hh" then player[:hp] += 100
  when "a"  then player[:awakened] = true
  when "w1" then weapon = pick_weapon
  when "w2" then weapon = special_weapon
  when "w"  then weapon[:durability] += 1
  when "ww" then weapon[:durability] -= 1
  end
  print `clear`
  weapon[:durability] = weapon[:durability].clamp(0, 10)
  return enemies, weapon
end

# boss menu cheat interface. Not possible to combine the 2

def cheat_menu_boss(user_choice, player, weapon, the_boss, boss_style)
  case user_choice
  when "h"  then player[:hp] -= 100
  when "hh" then player[:hp] += 100
  when "w1" then weapon = pick_weapon
  when "w2" then weapon = special_weapon
  when "w"  then weapon[:durability] += 1
  when "ww" then weapon[:durability] -= 1
  when "b"  then the_boss[:hp] -= 200
  when "1"  then boss_style = "🍻 Barkeep"
  when "2"  then boss_style = "🕶️ Bouncer"
  when "3"  then boss_style = "🎶 Band"
  when "v"  then player[:cash] -= 1
  when "c"  then player[:cash] += 1
  when "f"  then player[:drunk] -= 1
  when "d"  then player[:drunk] += 1
  end
  print `clear`
  weapon[:durability] = weapon[:durability].clamp(0, 10)
  player[:cash] = player[:cash].clamp(0, 20)
  player[:drunk] = player[:drunk].clamp(0, 20)
  return weapon, boss_style
end
