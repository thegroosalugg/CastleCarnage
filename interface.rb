# rubocop:disable all
require_relative 'imports'
#-----------------------------YOUR CODE BELOW---------------------------------->

def play_game(player)
  print `clear`
  name_player(player)
  enemies = []
  3.times { enemies << random_enemy(player) }
  target = 0
  player[:tracks] = enemies[target]
  shout(player, :intro)
  game_info(enemies, player)

  while !enemies.empty? && player[:hp].positive?
    target = 0 if enemies[target].nil?
    shout(enemies[target], :target)
    load_menu(player, :main)
    player[:choice] = gets.chomp.downcase # choice is passed as an argument to cheat menu

    print `clear`
    case player[:choice]
    when "5" then target = (target - 1) % enemies.length; shout(enemies[target], :combat)
    when "6" then target = (target + 1) % enemies.length; shout(enemies[target], :combat)
    when "t" then brawl(enemies, player, enemies[target])
    when "r" then specials(enemies, player, enemies[target])
    when "y" then escape_room(enemies, player)
    when "e" then the_shop(player)
    else shout(player, :error)
    end

    cheat_mode(enemies, player, enemies[target]) # DEBUG CHEAT MENU
    graveyard(enemies, player)
    level_up(player)
    game_info(enemies, player)
    player[:land] = { id: :move, art: "#{YL}#{BATTLEFIELD.sample}#{CL}" } unless player[:land][:id] == :room # resets ASCII art to this arena
  end
  game_over(player)
end

def specials(enemies, player, target)
  if player[:weapon] && !player[:weapon][:bonus].empty? && !player[:drain]
    case player[:weapon][:bonus]
    when :somersault then   somersault(enemies, player)
    when :gambler    then    blackjack(enemies, player, target)
    when :psychic    then    coin_flip(enemies, player, target)
    when :stylish    then   rochambeau(enemies, player, target)
    when :sneaky     then sneak_attack(enemies, player, target)
    end                                                      # pow message
    player[:land]   = { id: :still, offset: 10, art: "#{MG}#{SOUND_EFFECTS.sample}#{CL}" } if [:somersault, :sneaky].include?(player[:weapon][:bonus])
    player[:shop]  = false #  shop is disabled each round whether accessed or not
    player[:drain] = true
    player[:xp]   += 1
  else shout(player, :error)
  end
end

def ctrl_s(player) # player is saved on game over and can be used again on replay
  player          = player.dup
  player[:max_hp] = 99 + player[:level]
  player[:hp]     = player[:max_hp]
  player[:land]   = { id: :move, art: "#{RD}#{BATTLEFIELD.sample}#{CL}" }
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
