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
