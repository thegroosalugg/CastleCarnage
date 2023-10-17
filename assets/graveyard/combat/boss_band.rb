# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def mosh_pit(the_boss, boss_style, player, cash_lost) # damage reduced by cash lost, multiplier incresed by drunkenness
  cash_lost = 3 if cash_lost.zero? && player[:cash].zero?
  damage = ((rand(player[:attack]) - cash_lost * rand(2.0..3.5)) * (1.0 + player[:drunk] * 0.1)).to_i.clamp(1, 100)
  the_boss[:hp] -= damage
  shots_fired(player, the_boss, damage, :hit)
end

def swing(attacker, target, method) # boss does bonus damage on keg stand
  multiplier = method == :keg && attacker[:id] == :boss ? rand(1.0..1.5) : 0.7
  damage = (rand(attacker[:attack]) * multiplier).to_i.clamp(1, 100)
  target[:hp] -= damage
  shots_fired(attacker, target, damage, :hit)
end

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

def fight_the_band(player, buddy, weapon, the_boss, boss_style, load_boss)
  choice = 0
  boss_walks(the_boss, boss_style, :intro)
  load_boss = the_band

  until (4..6).include?(choice)
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    choice = gets.chomp.to_i
    case choice
    when 4
      print `clear`                                                        # band boss always strikes first
      the_boss[:rage] = (the_boss[:rage] - 1).clamp(0, 10)
      cash_lost = boss_strikes_back(the_boss, boss_style, player, buddy, weapon)  # player damage decreased by cash lost and increased by drunkenness
      mosh_pit(the_boss, boss_style, player, cash_lost)
    when 5
      print `clear`
      the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
      dance_off(player, buddy, weapon, the_boss, boss_style, load_boss)
    when 6
      print `clear`
      the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
      keg_stand(player, buddy, weapon, the_boss, boss_style, load_boss)
    else
      error(:input)
    end
  end

  strike(buddy, the_boss) if (buddy && buddy[:hp].positive?) && rand(2) == 1
  boss_walks(the_boss, boss_style, :reprise) unless player[:drunk].zero?
  player[:drunk] = (player[:drunk] - 1).clamp(0, 20)
  boss_style = the_boss[:style].sample
  boss_walks(the_boss, boss_style, :outro) if the_boss[:hp].positive?
  return boss_style
end