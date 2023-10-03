# rubocop:disable all
require_relative 'main/attack_mode'
require_relative 'main/war_machine'
require_relative 'main/escape_room'
require_relative 'boss/big_boss'
require_relative 'boss/blood_magic'
require_relative 'boss/boss_barkeep'
require_relative 'boss/boss_bouncer'
require_relative 'boss/boss_band'
require_relative 'boss/beatdown'
require_relative 'main/messages/fighting_talk'
require_relative 'main/messages/not_gonna_get_us'
require_relative 'main/messages/intro_outro'
require_relative 'main/messages/menu'
require_relative 'boss/messages/boss_art'
require_relative 'boss/messages/boss_menu'
require_relative 'boss/messages/talks_with_the_boss'
require_relative 'boss/messages/war_letters'
require_relative 'boss/messages/blood_letters'
require_relative 'debug/cheat_mode'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game
  print `clear`
  player = { id: :player, hp: rand(250..300), attack: (20..35).to_a, block: (1..10).to_a, cash: rand(2..12), drunk: 0 }
  name_player(player)
  enemy = random_enemy
  second_enemy = nil
  tracked_enemy = enemy
  weapon = pick_weapon
  enemies_defeated = 0
  rooms_explored = 0
  the_boss = big_boss_awaits

  intro(player, weapon, enemy)
  state_of_game(enemy, second_enemy, player, weapon)

  while (enemy || second_enemy) && player[:hp].positive?

    if weapon[:durability].positive?                              # Fight menu when weapon equipped
      weapon[:broken] = false
      load_menu
      user_choice = gets.chomp.downcase
      # DEBUG CHEAT MENU
      enemy, second_enemy, weapon = cheat_menu(player, enemy, second_enemy, weapon, user_choice)
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

    elsif user_choice == "r"                                      # Target single enemy with somersault attack
      print `clear`

      target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
      somersault_attack(player, target_enemy, weapon)

    elsif user_choice == "y"                                      # Avoid combat and run through rooms. Counter records no. of rooms explored
      print `clear` unless weapon[:broken]

      escape_attempt(enemy, second_enemy, player, weapon) unless weapon[:broken]
      rooms_explored += 1
      enemy, weapon, second_enemy = explore_rooms(enemy, weapon, player, second_enemy) unless player[:hp] <= 0

    else
      error_message
    end

    # check for enemy deaths, update counter, track last enemy for game over
    [enemy, second_enemy].each_with_index do |current_enemy, index|
      if current_enemy && current_enemy[:hp] <= 0
        enemies_defeated += 1
        enemy_killed(current_enemy)
        tracked_enemy = current_enemy
        if index == 0
          enemy = nil
        elsif index == 1
          second_enemy = nil
        end
      end
    end

    # Player dies and last enemy is tracked. Random enemy if both present, elsif enemy, else second enemy
    tracked_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy if player[:hp] <= 0

    # ((enemies_defeated > 1) || (rooms_explored > 8) || (enemies_defeated > 0 && rooms_explored > 5)) && (rand(1..2) == 1) ? big_boss_battle : big_boss_warning
    if rooms_explored.zero?
      enemies_defeated = 2 # debug
      rooms_explored = 5 # debug
      enemy = nil; second_enemy = nil; tracked_enemy = the_boss
      bonus(player, rooms_explored, enemies_defeated)
      big_boss_battle(player, weapon, the_boss)
    end

    state_of_game(enemy, second_enemy, player, weapon) unless tracked_enemy[:id] == :boss || weapon[:durability].zero?
  end

  state_of_game(enemy, second_enemy, player, weapon) if tracked_enemy[:id] == :enemy && weapon[:durability].zero?
  game_over(tracked_enemy, player)
end

play_game
