# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game(player)
  print `clear`
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  player[:tracking] = enemies.sample

  intro(player)
  game_info(enemies, player)

  while !enemies.empty? && player[:hp].positive?
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
      explore_rooms(enemies, player) unless player[:hp] <= 0
    else
      error(:input)
    end

    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    cheat_mode(player, enemies) # DEBUG CHEAT MENU
    graveyard(enemies, player)
    game_info(enemies, player)
  end
  game_over(player)
end

def ctrl_s(player)
  player = player.dup
  player[:hp] = 100 if player[:hp] < 100
  player[:land] = { id: :move, art: BATTLEFIELD.sample }
  return player
end

player = wake_up
loop do
  player = ctrl_s(player) # Update player using ctrl_s
  play_game(player)

  loop do
    choice = gets.chomp.downcase
    if choice == "n"
      exit # Exit the program if 'n' is selected
    elsif choice == "y"
      break # Restart the game
    # else
    #   error(:input)
    end
  end
end
