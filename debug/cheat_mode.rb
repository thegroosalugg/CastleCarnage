# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemies, weapon, user_choice)
  case user_choice
  when 'e'  then enemies.first[:hp] -= 100
  when 'ee' then enemies << random_enemy
  when "h"  then player[:hp] -= 100
  when "hh" then player[:hp] += 100
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

def cheat_menu_boss(user_choice, player, buddy, weapon, the_boss, boss_style)
  case user_choice
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
  return buddy, weapon, boss_style
end

# change text color in terminal with these codes

# Red:     \e[31mText\e[0m
# Green:   \e[32mText\e[0m
# Yellow:  \e[33mText\e[0m
# Blue:    \e[34mText\e[0m
# Magenta: \e[35mText\e[0m
# Cyan:    \e[36mText\e[0m
# White:   \e[37mText\e[0m
# Orange:  \e[38;5;208mText\e[0m
