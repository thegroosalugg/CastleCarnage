# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pay_the_tab(player, the_boss)
  cash_spent = player[:cash].zero? ? 0 : (1..[player[:cash], 6].min).to_a.sample
  multiplier = cash_spent.zero? ? 0.6 : 1.0 + (cash_spent * 0.5)
  damage = ((player[:attack].sample * (100 - player[:drunk] * 5) / 100) * multiplier).to_i

  the_boss[:hp] -= damage
  player[:cash] -= cash_spent
  player[:drunk] = (player[:drunk] + cash_spent).clamp(0, 20)
  damage_info(the_boss, damage)
end

def bar_fight(player, the_boss)
  drunk_adjustment = player[:drunk].zero? ? [2, 3].sample : [-2, -1, 1, 2, 3].sample
  wallet_adjustment = player[:cash] >= 20 ? [-2, -3].sample : [-3, -2, -1, 1, 2].sample

  player[:drunk] = (player[:drunk] + drunk_adjustment).clamp(0, 20)
  player[:cash] = (player[:cash] + wallet_adjustment).clamp(0, 20)

  bar_fight_outcome(drunk_adjustment, wallet_adjustment)

  damage = (player[:attack].sample * (100 - player[:drunk] * 5) / 100).to_i # updates damage to current drunkness
  the_boss[:hp] -= damage
  damage_info(the_boss, damage)
end

def fight_the_barkeep(player, weapon, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i

    if user_choice == 4
      print `clear`
      pay_the_tab(player, the_boss)
    elsif user_choice == 5
      print `clear`
      bar_fight(player, the_boss)
    else
      error_message
    end
  end

  boss_style = the_boss[:style].sample
end
