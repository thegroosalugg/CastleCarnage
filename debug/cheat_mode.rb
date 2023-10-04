# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemy, second_enemy, weapon, user_choice)
  case user_choice
  when "ee"then enemy = random_enemy
  when "e" then enemy[:hp] -= 100 if enemy
  when "ss"then second_enemy = random_enemy
  when "s" then second_enemy[:hp] -= 100 if second_enemy
  when "h" then player[:hp] -= 100
  when "hh"then player[:hp] += 100
  when "w" then weapon = pick_weapon
  when "ww"then weapon = special_weapon
  when "w1"then weapon[:durability] -= 1
  when "w2"then weapon[:durability] += 1
  end
  print `clear`
  weapon[:durability] = weapon[:durability].clamp(0, 10)
  return enemy, second_enemy, weapon
end

# boss menu cheat interface. Not possible to combine the 2

def cheat_menu_boss(user_choice, player, weapon, the_boss, boss_style)
  case user_choice
  when "h" then player[:hp] -= 100
  when "hh"then player[:hp] += 100
  when "w" then weapon = pick_weapon
  when "ww"then weapon = special_weapon
  when "w1"then weapon[:durability] -= 1
  when "w2"then weapon[:durability] += 1
  when "b" then the_boss[:hp] -= 200
  when "1" then boss_style = "🍻 Barkeep"
  when "2" then boss_style = "🕶️ Bouncer"
  when "3" then boss_style = "🎶 Band"
  when "v" then player[:cash] -= 1
  when "c" then player[:cash] += 1
  when "f" then player[:drunk] -= 1
  when "d" then player[:drunk] += 1
  end
  print `clear`
  weapon[:durability] = weapon[:durability].clamp(0, 10)
  player[:cash] = player[:cash].clamp(0, 20)
  player[:drunk] = player[:drunk].clamp(0, 20)
  return weapon, boss_style
end
