# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# possibly also sneak attack - steal enemy weapons
# possibly summon buddies

def dance_off(player, buddy, weapon, the_boss, boss_style, load_boss)
  greeting(:combat)
  boss_moves = []
  user_moves = []

  4.times do |round|
    break if player[:hp] <= 0 || the_boss[:hp] <= 0
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
    game_menu(:dance)

    boss_moves << rand(4..6)
    choice = 0

    until (4..6).include?(choice)
      choice = gets.chomp.to_i
      error(:input) unless (4..6).include?(choice)
      game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
      game_menu(:dance)
    end

    user_moves << choice
    print `clear`
    show_your_moves(player, the_boss, user_moves, boss_moves, :dance)

    swing(player, the_boss, :dance) if (choice > boss_moves[round]) || (choice == 4 && boss_moves[round] == 6) unless (boss_moves[round] == 4 && choice == 6)
    swing(the_boss, player, :dance) if (boss_moves[round] > choice) || (boss_moves[round] == 4 && choice == 6) unless (choice == 4 && boss_moves[round] == 6)
    "#{shots_fired(player, the_boss, :missed)} #{shots_fired(the_boss, player, :missed)}" if choice == boss_moves[round]
  end
end

def keg_stand(player, buddy, weapon, the_boss, boss_style, load_boss)
  greeting(:combat)

  loop do
    boss_move = [4, 5].sample
    choice = 0
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
    game_menu(:keg)

    until [4, 5].include?(choice)
      choice = gets.chomp.to_i
      error(:input) unless [4, 5].include?(choice)
      game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
      game_menu(:keg)
    end

    print `clear`
    show_your_moves(player, the_boss, choice, boss_move, :keg)

    if choice == boss_move
      swing(player, the_boss, :keg)
      player[:drunk] = (player[:drunk] + 2).clamp(0, 20)
    else
      swing(the_boss, player, :keg)
      break # Exit loop if choices don't match
    end
  end
end
