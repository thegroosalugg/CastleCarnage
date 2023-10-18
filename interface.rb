# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game
  print `clear`
  player = wake_up
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  player[:tracking] = enemies.sample

  intro(player)
  state_of_game(enemies, player)

  while !enemies.empty? && player[:hp].positive?
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    load_menu
    player[:choice] = gets.chomp.downcase # choice is passed as an argument to cheat menu

    case player[:choice]
    when "t"
      print `clear`
      mortal_kombat(enemies, player)
    when "r"
      print `clear`
      somersault_attack(player, enemies)
    when "y"
      print `clear`
      surprise(enemies, player, :escape)
      player[:rooms] += 1
      explore_rooms(enemies, player) unless player[:hp] <= 0
    else
      error(:input)
    end

    cheat_menu(player, enemies) # DEBUG CHEAT MENU
    graveyard(enemies, player)
    state_of_game(enemies, player)
  end
  game_over(player)
end

loop do
  play_game
  choice = gets.chomp.downcase
  break if choice != "y"
end
