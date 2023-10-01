# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# debug cheat menu for interface

def cheat_menu(player, enemy, second_enemy, weapon, user_choice)

  case user_choice
  when "h"
    print `clear`
    player[:hp] += 100
  when "hh"
    print `clear`
    player[:hp] -= 100
  when "w"
    print `clear`
    weapon = pick_weapon
  when "w1"
    print `clear`
    weapon[:durability] -= 1
  when "w2"
    print `clear`
    weapon[:durability] += 1
  when "e"
    print `clear`
    enemy = random_enemy
  when "ee"
    print `clear`
    enemy[:hp] -= 100 if enemy
  when "s"
    print `clear`
    second_enemy = random_enemy
  when "ss"
    print `clear`
    second_enemy[:hp] -= 100 if second_enemy
  end
  return enemy, second_enemy, weapon
end

# debug cheat menu for big boss

def cheat_menu_boss(user_choice, player, weapon, the_boss, boss_style)

  case user_choice
  when 1
    print `clear`
    the_boss[:hp] -= 200
  when 11
    print `clear`
    player[:hp] -= 100
  when 2
    print `clear`
    weapon[:durability] -= 1
  when 22
    print `clear`
    weapon[:durability] += 1
  when 21
    print `clear`
    weapon = pick_weapon
  when 23
    print `clear`
    weapon = special_weapon
  when 3
    print `clear`
    boss_style = "🍻 Barkeep"
  when 33
    print `clear`
    boss_style = "🕶️ Bouncer"
  when 32
    print `clear`
    boss_style = "🚾 Toilet Guy"
  end
  return weapon, boss_style
end
