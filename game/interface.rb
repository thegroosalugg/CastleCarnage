# rubocop:disable all
require_relative 'enemies_weapons'
require_relative 'attack_mode'
require_relative 'escape_room'
require_relative 'messages/menu'
require_relative 'messages/intro_outro'
require_relative 'messages/combat_messages'
require_relative 'messages/explore_messages.rb'
#-----------------------------YOUR CODE BELOW---------------------------------->

print `clear`

player = { hp: rand(200..300), block: (1..10).to_a }
enemy = random_enemy
second_enemy = nil
weapon = pick_weapon
weapon_broken = false

intro_enemy(enemy)
intro_weapon(weapon, enemy)
state_of_game(enemy, second_enemy, player, weapon)

while (enemy || second_enemy) && player[:hp] > 0

  if weapon[:durability] > 0
    weapon_broken = false
    load_menu
    user_action = gets.chomp.downcase
  else
    weapon_broke(weapon) unless weapon_broken
    weapon_broken = true
    user_action = "y"
  end

  if user_action == "t"
    print `clear`

    player_attack(enemy, weapon) if enemy
    enemy_attack(enemy, player) if enemy

    puts "----------------------------------------------------------------------" if second_enemy
    player_attack(second_enemy, weapon) if second_enemy
    enemy_attack(second_enemy, player) if second_enemy

  elsif user_action == "r"
    print `clear`

    if enemy && second_enemy
      random_enemy = [enemy, second_enemy].sample
      somersault_attack(random_enemy, weapon, player)
    elsif enemy
      somersault_attack(enemy, weapon, player)
    elsif second_enemy
      somersault_attack(second_enemy, weapon, player)
    end

  elsif user_action == "y"
    print `clear` unless weapon_broken
    if rand(1..5) == 1
      random_attack_message(enemy) if enemy
      enemy_attack(enemy, player) if enemy
      random_attack_message(second_enemy) if second_enemy
      enemy_attack(second_enemy, player) if second_enemy
    end
    state_of_game(enemy, second_enemy, player, weapon) unless weapon_broken
    enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy)

  else
    error_message
  end

  if enemy && enemy[:hp] <= 0
    enemy_killed(enemy)
    tracked_enemy = enemy
    enemy = nil
  end

  if second_enemy && second_enemy[:hp] <= 0
    enemy_killed(second_enemy)
    tracked_enemy = second_enemy
    second_enemy = nil
  end

  if player[:hp] <= 0
    tracked_enemy = second_enemy if second_enemy
  else
    tracked_enemy = enemy if enemy
  end

  state_of_game(enemy, second_enemy, player, weapon)
end

enemy == nil && second_enemy == nil && player[:hp] > 0 ? win_message(tracked_enemy) : lose_message(tracked_enemy)
