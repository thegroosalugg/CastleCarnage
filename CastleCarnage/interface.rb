# rubocop:disable all
require_relative 'main/attack_mode'
require_relative 'main/war_machine'
require_relative 'main/escape_room'
require_relative 'boss/big_boss'
require_relative 'boss/blood_magic'
require_relative 'boss/boss_battle'
require_relative 'main/messages/combat_messages'
require_relative 'main/messages/explore_messages'
require_relative 'main/messages/intro_outro'
require_relative 'main/messages/menu'
require_relative 'boss/messages/boss_art'
require_relative 'boss/messages/boss_menu'
require_relative 'boss/messages/war_letters'
require_relative 'boss/messages/blood_letters'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { hp: rand(250..300), attack: (30..60).to_a, block: (1..10).to_a, cash: rand(2..12), drunk: 0 }
enemy = random_enemy
second_enemy = nil
tracked_enemy = enemy
weapon = pick_weapon
enemies_defeated = 0
rooms_explored = 0
the_boss = big_boss_awaits

name_player(player)
intro(player, weapon, enemy)
state_of_game(enemy, second_enemy, player, weapon)

while (enemy || second_enemy) && player[:hp].positive?

  if weapon && weapon[:durability].positive?
    load_menu
    user_choice = gets.chomp.downcase
  else
    weapon_broke(weapon) if weapon
    weapon = nil
    user_choice = "y"
  end

  if user_choice == "t"
    print `clear`

    player_attack(enemy, weapon) if enemy
    enemy_attack(enemy, player) if enemy

    puts SEPARATOR if second_enemy
    player_attack(second_enemy, weapon) if second_enemy
    enemy_attack(second_enemy, player) if second_enemy

  elsif user_choice == "r"
    print `clear`

    target_enemy = enemy || second_enemy
    somersault_attack(target_enemy || [enemy, second_enemy].sample, weapon, player) if target_enemy

  elsif user_choice == "y"
    print `clear` if weapon
    rooms_explored += 1
    if rand(1..5) == 1
      target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
      random_attack_message(target_enemy)
      enemy_attack(target_enemy, player)
    end
    enemy ? run_away(enemy) : run_away(second_enemy)
    state_of_game(enemy, second_enemy, player, weapon) unless player[:hp] <= 0
    enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy) unless player[:hp] <= 0

    # DEBUG CHEAT MENU
  elsif user_choice == "g"
    print `clear`
    player[:hp] -= 200
  elsif user_choice == "h"
    print `clear`
    enemy[:hp] -= 200 if enemy
    second_enemy[:hp] -= 200 if second_enemy
  elsif user_choice == "j"
    print `clear`
    weapon[:durability] -= 1
  elsif user_choice == "f"
    print `clear`
    second_enemy = random_enemy
    # ENF OF MENU

  else
    error_message
  end

  if enemy && enemy[:hp] <= 0
    enemies_defeated += 1
    enemy_killed(enemy)
    tracked_enemy = enemy
    enemy = nil
  end

  if second_enemy && second_enemy[:hp] <= 0
    enemies_defeated += 1
    enemy_killed(second_enemy)
    tracked_enemy = second_enemy
    second_enemy = nil
  end

  if player[:hp] <= 0
    tracked_enemy = second_enemy if second_enemy
  else
    tracked_enemy = enemy if enemy
  end

  # puts "[DEBUG] [Enemies Defeated: #{enemies_defeated}] || [Rooms Explored: #{rooms_explored}]"
  # puts "BIG BOSS BATTLE" if (enemies_defeated > 1) || (rooms_explored > 15) || (enemies_defeated > 0 && rooms_explored > 10)
  # ((enemies_defeated > 1) || (rooms_explored > 8) || (enemies_defeated > 0 && rooms_explored > 5)) && (rand(1..2) == 1) ? big_boss_battle : big_boss_warning
  if rooms_explored > 10
    enemies_defeated = 2 # debug
    rooms_explored = 5 # debug
    player[:hp] += 100 + (rooms_explored * 20); player[:block] = player[:block].map { |block| block + enemies_defeated }
    enemy = nil; second_enemy = nil; tracked_enemy = the_boss
    big_boss_battle(player, weapon, the_boss)
  end

  state_of_game(enemy, second_enemy, player, weapon) unless tracked_enemy == the_boss || (weapon.nil? || weapon[:durability].zero?)
end

game_over(tracked_enemy, player)
