# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game
  print `clear`
  player = wake_up
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  tracked_enemy = enemies.sample
  the_boss = big_boss_awaits

  intro(player, tracked_enemy)
  state_of_game(enemies, player, load_art = battlefield)

  while !enemies.empty? && player[:hp].positive?
    load_art = battlefield
    load_menu
    choice = gets.chomp.downcase

    # DEBUG CHEAT MENU
    enemies = cheat_menu(player, enemies, choice)

    case choice
    when "t"
      print `clear`
      mortal_kombat(enemies, player, load_art)
    when "r"
      print `clear`
      somersault_attack(player, enemies)
    when "y"
      print `clear`
      surprise(enemies, player, :escape)
      player[:rooms] += 1
      enemies = explore_rooms(enemies, player, load_art) unless player[:hp] <= 0
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
    # tracked_enemy = the_boss if enemies.empty?
    state_of_game(enemies, player, load_art) #unless tracked_enemy[:id] == :boss || weapon[:durability].zero?
  end

  # boss_orders(player, weapon, the_boss) unless player[:hp] <= 0
  #state_of_game(enemies, player, weapon, load_art) if tracked_enemy[:id] == :enemy && weapon[:durability].zero?
  game_over(tracked_enemy, player)
end

loop do
  play_game
  choice = gets.chomp.downcase
  break if choice != "y"
end
