# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def mosh_pit(the_boss, boss_style, player, cash_lost) # damage reduced by cash lost, multiplier incresed by drunkenness
  cash_lost = 3 if cash_lost.zero? && player[:cash].zero?
  damage = ((rand(player[:attack]) - cash_lost * rand(2.0..3.5)) * (1.0 + player[:drunk] * 0.1)).to_i.clamp(0, 100)
  the_boss[:hp] -= damage
  invoice(player, player[:drunk], :pit)
  shots_fired(player, the_boss, damage, :hit)
end

def swing(attacker, target)
  damage = (rand(attacker[:attack]) * 0.6).to_i
  target[:hp] -= damage
  shots_fired(attacker, target, damage, :hit)
end

def dance_off(player, weapon, the_boss, boss_style, load_boss)
  game_info(player, weapon, the_boss, boss_style, load_boss)
  step_on_up
  boss_moves = []
  user_moves = []

  4.times do |round|
    boss_moves << rand(4..6)
    user_choice = 0

    until (4..6).include?(user_choice)
      user_choice = gets.chomp.to_i
      error_message unless (4..6).include?(user_choice)
      game_info(player, weapon, the_boss, boss_style, load_boss) unless (4..6).include?(user_choice)
      step_on_up unless (4..6).include?(user_choice)
    end

    user_moves << user_choice
    print `clear`
    show_your_moves(player, the_boss, user_moves, boss_moves) # Paper, Scizzors, Rock rules. Highes number wins, except 1 > 3
    swing(player, the_boss) if (user_choice > boss_moves[round]) || (user_choice == 4 && boss_moves[round] == 6) unless (boss_moves[round] == 4 && user_choice == 6)
    swing(the_boss, player) if (boss_moves[round] > user_choice) || (boss_moves[round] == 4 && user_choice == 6) unless (user_choice == 4 && boss_moves[round] == 6)
    if round < 3  # Check if it's not the last round
      game_info(player, weapon, the_boss, boss_style, load_boss)
      step_on_up
    end
  end
end

def fight_the_band(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  boss_walks(the_boss, boss_style, :intro)

  until [4, 5].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    if user_choice == 4
      print `clear`                                                        # band boss always strikes first
      cash_lost = boss_strikes_back(the_boss, boss_style, player, weapon)  # player damage decreased by cash lost and increased by drunkenness
      mosh_pit(the_boss, boss_style, player, cash_lost)
    elsif user_choice == 5
      print `clear`
      dance_off(player, weapon, the_boss, boss_style, load_boss)
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
