# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_power(player, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5].include?(user_choice)
    game_info(player, the_boss, boss_style, load_boss)
    fight_menu(boss_style)

    damage = ((40..80).to_a.sample * (100 - player[:drunk] * 5) / 100).to_i
    user_choice = gets.chomp.to_i

    if user_choice == 4
      cash_spent = player[:cash].zero? ? 0 : (1..[player[:cash], 6].min).to_a.sample
      multiplier = cash_spent.zero? ? 0.6 : 1.0 + (cash_spent * 0.5)
      total_damage = (damage * multiplier).to_i
      the_boss[:hp] -= total_damage
      player[:cash] -= cash_spent
      player[:drunk] = [player[:drunk] + cash_spent, 20].min
    elsif user_choice == 5
      puts "tba"
    else
      error_message
    end
  end

  print `clear`
  damage_info(the_boss, total_damage)
  boss_style = the_boss[:style].sample
end
