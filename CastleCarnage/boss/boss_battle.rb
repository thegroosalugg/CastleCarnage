# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pay_the_tab(player, the_boss, damage)
  cash_spent = player[:cash].zero? ? 0 : (1..[player[:cash], 6].min).to_a.sample
  multiplier = cash_spent.zero? ? 0.6 : 1.0 + (cash_spent * 0.5)
  total_damage = (damage * multiplier).to_i

  the_boss[:hp] -= total_damage
  player[:cash] -= cash_spent
  player[:drunk] = (player[:drunk] + cash_spent).clamp(0, 20)

  total_damage
end

def bar_fight(player, the_boss)
  drunk_adjustment = [-1, 1, 2].sample
  wallet_adjustment = [-2, -1, 1].sample

  player[:drunk] = (player[:drunk] + drunk_adjustment).clamp(0, 20)
  player[:cash] = (player[:cash] + wallet_adjustment).clamp(0, 20)

  drunk_adjustment.positive? ? got_drunk(drunk_adjustment) : sobered_up(drunk_adjustment)
  wallet_adjustment.positive? ? got_cash(wallet_adjustment) : got_mugged(wallet_adjustment)

  total_damage = ((40..80).to_a.sample * (100 - player[:drunk] * 5) / 100).to_i # update damage to current drunkness
  the_boss[:hp] -= total_damage

  total_damage
end

def fight_the_power(player, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5].include?(user_choice)
    game_info(player, the_boss, boss_style, load_boss)
    fight_menu(boss_style)

    damage = ((40..80).to_a.sample * (100 - player[:drunk] * 5) / 100).to_i
    user_choice = gets.chomp.to_i

    if user_choice == 4
      print `clear`
      total_damage = pay_the_tab(player, the_boss, damage) # Get total damage
    elsif user_choice == 5
      print `clear`
      total_damage = bar_fight(player, the_boss)
    else
      error_message
    end
  end

  damage_info(the_boss, total_damage)
  boss_style = the_boss[:style].sample
end
