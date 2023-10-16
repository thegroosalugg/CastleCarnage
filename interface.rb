# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game
  print `clear`
  player = { id: :player, hp: rand(275..300), attack: (rand(25..30)..rand(35..40)), block: (1..10), cash: rand(3..10), drunk: 0, kills: 0, rooms: 0 }
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  tracked_enemy = enemies.sample
  weapon = pick_weapon
  the_boss = big_boss_awaits

  intro(player, weapon, tracked_enemy)
  state_of_game(enemies, player, weapon, load_art = battlefield)

  while !enemies.empty? && player[:hp].positive?
    load_art = battlefield

    if weapon[:durability].positive?                              # Fight menu when weapon equipped
      weapon[:broken] = false
      load_menu
      choice = gets.chomp.downcase
      # DEBUG CHEAT MENU
      enemies, weapon = cheat_menu(player, enemies, weapon, choice)
    else                                                          # Player must run through rooms if weapon broken
      weapon_speaks(weapon, :broke) unless weapon[:broken]
      weapon[:broken] = true
      escape_attempt(enemies, player, weapon, load_art)
      choice = "y"
    end

    case choice
    when "t"
      print `clear`
      mortal_kombat(enemies, player, weapon, load_art)
    when "r"                                      # Target random enemy with somersault attack
      print `clear`
      somersault_attack(player, enemies, weapon)
    when "y"                                      # Avoid combat and run through rooms. Counter records no. of rooms explored
      print `clear` unless weapon[:broken]
      escape_attempt(enemies, player, weapon, load_art) unless weapon[:broken]
      player[:rooms] += 1
      enemies, weapon = explore_rooms(enemies, weapon, player, load_art) unless player[:hp] <= 0
    else
      error(:input)
    end

    enemies.reject! do |enemy|
      if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
        player[:kills] += 1
        enemy_speaks(enemy, :pwned)
        tracked_enemy = enemy
        true  # This will remove the enemy from the array
      else
        false  # This will keep the enemy in the array
      end
    end

    tracked_enemy = enemies.sample if player[:hp] <= 0 # Player dies and last enemy is tracked
    tracked_enemy = the_boss if enemies.empty?
    state_of_game(enemies, player, weapon, load_art) unless tracked_enemy[:id] == :boss || weapon[:durability].zero?
  end

  boss_orders(player, weapon, the_boss) unless player[:hp] <= 0
  state_of_game(enemies, player, weapon, load_art) if tracked_enemy[:id] == :enemy && weapon[:durability].zero?
  game_over(tracked_enemy, player)
end

loop do
  play_game
  choice = gets.chomp.downcase
  break if choice != "y"
end
