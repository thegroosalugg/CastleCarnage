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

def dance_off(the_boss, boss_style, player)
  user_choice = []
  boss_moves =  Array.new(4) { rand(1..3) }
  until user_choice.all? { |digit| [1, 2, 3].include?(digit) } && user_choice.length == 4
    user_choice = gets.chomp.to_i.digits.reverse
    error_message
  end
  user_choice.each_with_index do |choice, index|
    swing(player, the_boss) if (choice > boss_moves[index]) || (choice == 1 && boss_moves[index] == 3) unless (boss_moves[index] == 1 && choice == 3)
    swing(the_boss, player) if (boss_moves[index] > choice) || (boss_moves[index] == 1 && choice == 3) unless (choice == 1 && boss_moves[index] == 3)
  end
end

def fight_the_band(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  blue_steel(the_boss, boss_style, :intro)

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
      dance_off(the_boss, boss_style, player)
      # boss_strikes_back(the_boss, boss_style, player, weapon)
    else
      error_message
    end
  end

  blue_steel(the_boss, boss_style, :reprise) unless player[:drunk].zero?
  player[:drunk] = (player[:drunk] - 1).clamp(0, 20)
  boss_style = the_boss[:style].sample
  blue_steel(the_boss, boss_style, :outro) if the_boss[:hp].positive?
  return boss_style
end
