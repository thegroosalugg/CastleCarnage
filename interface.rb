# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game(player)
  print `clear`
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy }
  player[:tracks] = enemies.sample
  shout(player, :intro)
  game_info(enemies, player)
  target = 0

  while !enemies.empty? && player[:hp].positive?
    shout(enemies[target], :target)
    load_menu(player, :main)
    player[:choice] = gets.chomp.downcase # choice is passed as an argument to cheat menu

    print `clear`
    case player[:choice]
    when "5" then target = (target - 1) % enemies.length
    when "6" then target = (target + 1) % enemies.length
    when "t" then brawl(enemies, player, enemies[target])
    when "r" then player[:weapon] && player[:weapon][:bonus] == :somersault ? somersault(enemies, player) : shout(player, :error)
    when "y" then escape_room(enemies, player)
    else shout(player, :error)
    end

    player[:land] = { id: :move, art: BATTLEFIELD.sample } # resets ASCII art to this arena
    cheat_mode(enemies, player) # DEBUG CHEAT MENU
    graveyard(enemies, player)
    game_info(enemies, player)
  end
  game_over(player)
end

def ctrl_s(player) # player is saved on game over and can be used again on replay
  player = player.dup
  player[:hp] = 100 if player[:hp] < 100
  player[:land] = { id: :move, art: BATTLEFIELD.sample }
  return player
end

player = wake_up # It all starts here
loop do
  player = ctrl_s(player) # Update player using ctrl_s
  play_game(player)

  loop do
    choice = gets.chomp.downcase
    case choice
    when "n" then exit # Exit the program
    when "y" then break # Restart the game
    else replay # end of game error screen
    end
  end
end
