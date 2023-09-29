# rubocop:disable all
require_relative 'main/attack_mode'
require_relative 'main/war_machine'
require_relative 'main/escape_room'
require_relative 'boss/big_boss'
require_relative 'boss/blood_magic'
require_relative 'boss/boss_battle'
require_relative 'main/messages/fighting_talk'
require_relative 'main/messages/not_gonna_get_us'
require_relative 'main/messages/intro_outro'
require_relative 'main/messages/menu'
require_relative 'boss/messages/boss_art'
require_relative 'boss/messages/boss_menu'
require_relative 'boss/messages/talks_with_the_boss'
require_relative 'boss/messages/war_letters'
require_relative 'boss/messages/blood_letters'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { id: "player", hp: rand(250..300), attack: (30..60).to_a, block: (1..10).to_a, cash: rand(2..12), drunk: 0 }
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

  if weapon[:durability].positive?                              # Fight menu when weapon equipped
    weapon[:broken] = false
    load_menu
    user_choice = gets.chomp.downcase
  else                                                          # Player must run through rooms if weapon broken
    weapon_broke(weapon) unless weapon[:broken]
    weapon[:broken] = true
    escape_attempt(enemy, second_enemy, player, weapon)
    user_choice = "y"
  end

  if user_choice == "t"
    print `clear`

    strike(player, enemy, weapon) if enemy                      # Player strikes
    strike(enemy, player) if enemy && enemy[:hp].positive?      # Enemy strikes back, unless you kill them first

    puts SEPARATOR if second_enemy                              # Repeat process if second enemy on your jock
    strike(player, second_enemy, weapon) if second_enemy
    strike(second_enemy, player) if second_enemy && second_enemy[:hp].positive?

  elsif user_choice == "r"
    print `clear`

    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    somersault_attack(player, target_enemy, weapon)

  elsif user_choice == "y"
    print `clear` unless weapon[:broken]

    escape_attempt(enemy, second_enemy, player, weapon) unless weapon[:broken]
    rooms_explored += 1
    enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy) unless player[:hp] <= 0

    # DEBUG CHEAT MENU
  elsif user_choice == "f"
    print `clear`
    player[:hp] -= 200
  elsif user_choice == "g"
    print `clear`
    enemy[:hp] -= 200 if enemy
  elsif user_choice == "h"
    print `clear`
    second_enemy[:hp] -= 200 if second_enemy
  elsif user_choice == "c"
    print `clear`
    weapon[:durability] -= 1
  elsif user_choice == "v"
    print `clear`
    weapon = pick_weapon
  elsif user_choice == "b"
    print `clear`
    enemy = random_enemy
  elsif user_choice == "n"
    print `clear`
    second_enemy = random_enemy
    # END OF MENU

  else
    error_message
  end

  if enemy && enemy[:hp] <= 0                                   # enemy dies
    enemies_defeated += 1                                       # defeated counter
    enemy_killed(enemy)
    tracked_enemy = enemy                                       # records last enemy to pass to game over method
    enemy = nil
  end

  if second_enemy && second_enemy[:hp] <= 0
    enemies_defeated += 1
    enemy_killed(second_enemy)
    tracked_enemy = second_enemy
    second_enemy = nil
  end

  # Player dies and last enemy is tracked. Random enemy if both present, elsif enemy, else second enemy
  tracked_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy if player[:hp] <= 0

  # puts "[DEBUG] [Enemies Defeated: #{enemies_defeated}] || [Rooms Explored: #{rooms_explored}]"
  # puts "BIG BOSS BATTLE" if (enemies_defeated > 1) || (rooms_explored > 15) || (enemies_defeated > 0 && rooms_explored > 10)
  # ((enemies_defeated > 1) || (rooms_explored > 8) || (enemies_defeated > 0 && rooms_explored > 5)) && (rand(1..2) == 1) ? big_boss_battle : big_boss_warning
  if rooms_explored > 110
    enemies_defeated = 2 # debug
    rooms_explored = 5 # debug
    bonus(player, rooms_explored, enemies_defeated)
    enemy = nil; second_enemy = nil; tracked_enemy = the_boss
    big_boss_battle(player, weapon, the_boss)
  end

  state_of_game(enemy, second_enemy, player, weapon) unless tracked_enemy[:id] == "boss" || weapon[:durability].zero?
end

state_of_game(enemy, second_enemy, player, weapon) if tracked_enemy[:id] == "enemy" && weapon[:durability].zero?
game_over(tracked_enemy, player)
