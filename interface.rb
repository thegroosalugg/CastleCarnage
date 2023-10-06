# rubocop:disable all
require_relative 'main/attack_mode'
require_relative 'main/war_machine'
require_relative 'main/escape_room'
require_relative 'boss/big_boss'
require_relative 'boss/powers/blood_magic'
require_relative 'boss/combat/boss_barkeep'
require_relative 'boss/combat/boss_bouncer'
require_relative 'boss/combat/boss_band'
require_relative 'boss/combat/beatdown'
require_relative 'main/messages/enemy_speaks'
require_relative 'main/messages/fighting_talk'
require_relative 'main/messages/not_gonna_get_us'
require_relative 'main/messages/intro_outro'
require_relative 'main/messages/menu'
require_relative 'boss/messages/boss_art'
require_relative 'boss/messages/boss_menu'
require_relative 'boss/messages/talks_with_the_boss'
require_relative 'boss/combat/messages/war_letters'
require_relative 'boss/powers/messages/blood_letters'
require_relative 'debug/cheat_mode'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game
  print `clear`
  player = { id: :player, hp: rand(250..300), attack: (rand(25..30)..rand(35..40)), block: (1..10), cash: rand(3..10), drunk: 0 }
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  tracked_enemy = enemies.sample
  weapon = pick_weapon
  enemies_defeated = 0
  rooms_explored = 0
  the_boss = big_boss_awaits

  intro(player, weapon, tracked_enemy)
  state_of_game(enemies, player, weapon)

  while !enemies.empty? && player[:hp].positive?

    if weapon[:durability].positive?                              # Fight menu when weapon equipped
      weapon[:broken] = false
      load_menu
      user_choice = gets.chomp.downcase
      # DEBUG CHEAT MENU
      enemies, weapon = cheat_menu(player, enemies, weapon, user_choice)
    else                                                          # Player must run through rooms if weapon broken
      weapon_speaks(weapon, :broke) unless weapon[:broken]
      weapon[:broken] = true
      escape_attempt(enemies, player, weapon)
      user_choice = "y"
    end

    if user_choice == "t"
      print `clear`
      mortal_kombat(enemies, player, weapon)

    elsif user_choice == "r"                                      # Target single enemy with somersault attack
      print `clear`

      target_enemy = enemies.sample
      somersault_attack(player, target_enemy, weapon)

    elsif user_choice == "y"                                      # Avoid combat and run through rooms. Counter records no. of rooms explored
      print `clear` unless weapon[:broken]

      escape_attempt(enemies, player, weapon) unless weapon[:broken]
      rooms_explored += 1
      enemies, weapon = explore_rooms(enemies, weapon, player) unless player[:hp] <= 0

    else
      error_message
    end

    # check for enemy deaths, update counter, track last enemy for game over
    enemies.each_with_index do |current_enemy, index|
      if current_enemy && current_enemy[:hp] <= 0
        enemies_defeated += 1
        enemy_speaks(current_enemy, :pwned)
        tracked_enemy = current_enemy
        enemies.delete_at(index) # Remove the defeated enemy from the array
      end
    end

    # Player dies and last enemy is tracked. Random enemy if both present, elsif enemy, else second enemy
    tracked_enemy = enemies.sample if player[:hp] <= 0

    # ((enemies_defeated > 1) || (rooms_explored > 8) || (enemies_defeated > 0 && rooms_explored > 5)) && (rand(1..2) == 1) ? big_boss_battle : big_boss_warning
    # if rooms_explored.zero?
    #   enemies_defeated = 2 # debug
    #   rooms_explored = 5 # debug
    #   enemy = nil; second_enemy = nil; tracked_enemy = the_boss
    #   bonus(player, rooms_explored, enemies_defeated)
    #   big_boss_battle(player, weapon, the_boss)
    # end

    state_of_game(enemies, player, weapon) unless tracked_enemy[:id] == :boss || weapon[:durability].zero?
  end

  state_of_game(enemies, player, weapon) if tracked_enemy[:id] == :enemy && weapon[:durability].zero?
  game_over(tracked_enemy, player)
end

loop do
  play_game
  user_choice = gets.chomp.downcase
  break if user_choice != "y"
end
