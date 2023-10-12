# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def mosh_pit(the_boss, boss_style, player, cash_lost) # damage reduced by cash lost, multiplier incresed by drunkenness
  cash_lost = 3 if cash_lost.zero? && player[:cash].zero?
  damage = ((rand(player[:attack]) - cash_lost * rand(2.0..3.5)) * (1.0 + player[:drunk] * 0.1)).to_i.clamp(1, 100)
  the_boss[:hp] -= damage
  invoice(player, player[:drunk], :pit)
  shots_fired(player, the_boss, damage, :hit)
end

def swing(attacker, target, method)
  multiplier = method == :keg && attacker[:id] == :boss ? rand(1.0..1.5) : 0.7
  damage = (rand(attacker[:attack]) * multiplier).to_i.clamp(1, 100)
  target[:hp] -= damage
  shots_fired(attacker, target, damage, :hit)
end

def dance_off(player, weapon, the_boss, boss_style, load_boss)
  greeting
  boss_moves = []
  user_moves = []

  4.times do |round|
    break if player[:hp] <= 0 || the_boss[:hp] <= 0
    game_info(player, weapon, the_boss, boss_style, load_boss)
    step_on_up(:dance)

    boss_moves << rand(4..6)
    user_choice = 0

    until (4..6).include?(user_choice)
      user_choice = gets.chomp.to_i
      error_message
      game_info(player, weapon, the_boss, boss_style, load_boss)
      step_on_up(:dance)
    end

    user_moves << user_choice
    print `clear`
    show_your_moves(player, the_boss, user_moves, boss_moves, :dance)

    swing(player, the_boss, :dance) if (user_choice > boss_moves[round]) || (user_choice == 4 && boss_moves[round] == 6) unless (boss_moves[round] == 4 && user_choice == 6)
    swing(the_boss, player, :dance) if (boss_moves[round] > user_choice) || (boss_moves[round] == 4 && user_choice == 6) unless (user_choice == 4 && boss_moves[round] == 6)
  end
end

def keg_stand(player, weapon, the_boss, boss_style, load_boss)
  greeting

  loop do
    boss_move = [4, 5].sample
    user_choice = 0
    game_info(player, weapon, the_boss, boss_style, load_boss)
    step_on_up(:keg)

    until [4, 5].include?(user_choice)
      user_choice = gets.chomp.to_i
      error_message
      game_info(player, weapon, the_boss, boss_style, load_boss)
      step_on_up(:keg)
    end

    print `clear`
    show_your_moves(player, the_boss, user_choice, boss_move, :keg)

    if user_choice != boss_move
      swing(player, the_boss, :keg)
      player[:drunk] = (player[:drunk] + 2).clamp(0, 20)
    else
      swing(the_boss, player, :keg)
      break # Exit loop if choices match
    end
  end
end

def fight_the_band(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  boss_walks(the_boss, boss_style, :intro)

  until (4..6).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    case user_choice
    when 4
      print `clear`                                                        # band boss always strikes first
      the_boss[:rage] = (the_boss[:rage] - 1).clamp(0, 10)
      cash_lost = boss_strikes_back(the_boss, boss_style, player, weapon)  # player damage decreased by cash lost and increased by drunkenness
      mosh_pit(the_boss, boss_style, player, cash_lost)
    when 5
      print `clear`
      the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
      dance_off(player, weapon, the_boss, boss_style, load_boss)
    when 6
      print `clear`
      the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
      keg_stand(player, weapon, the_boss, boss_style, load_boss)
    else
      error_message
    end
  end

  boss_walks(the_boss, boss_style, :reprise) unless player[:drunk].zero?
  player[:drunk] = (player[:drunk] - 1).clamp(0, 20)
  boss_style = the_boss[:style].sample
  boss_walks(the_boss, boss_style, :outro) if the_boss[:hp].positive?
  return boss_style
end
