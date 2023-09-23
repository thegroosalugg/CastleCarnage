# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_power(player, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5].include?(user_choice)
    game_info(player, the_boss, boss_style)
    puts load_boss
    fight_menu(boss_style)

    damage = ((40..80).to_a.sample * (100 - player[:drunk] * 5) / 100).to_i
    user_choice = gets.chomp.to_i

    if user_choice == 4
      cash_spent = player[:cash].zero? ? 0 : (1..[player[:cash], 5].min).to_a.sample
      multiplier = 1.0 + (cash_spent * 0.4)
      the_boss[:hp] -= damage * multiplier
      player[:cash] -= cash_spent
      player[:drunk] += cash_spent
      player[:drunk] = [player[:drunk], 19].min
    elsif user_choice == 5
      puts "tba"
    else
      error_message
    end
  end

  print `clear`
  puts cash_spent
  damage_info(the_boss, boss_style, damage, multiplier)
  boss_style = the_boss[:style].sample
end

def pay_with_blood(player, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5, 6].include?(user_choice)
    game_info(player, the_boss, boss_style)
    puts load_boss
    blood_menu

    user_choice = gets.chomp.to_i

    if user_choice == 4
      player[:hp] -= (20..50).to_a.sample
      player[:block] = player[:block].map { |block| block + 1 }
    elsif user_choice == 5
      blood_for_cash = rand(2..8)
      player[:hp] -= blood_for_cash * 10; player[:cash] += blood_for_cash
    elsif user_choice == 6
      ibuprofen = player[:drunk].zero? ? 0 : (2..[player[:drunk], 2].max).to_a.sample
      player[:hp] -= (ibuprofen * rand(5.0..10.0)).to_i
      player[:drunk] -= ibuprofen
      player[:drunk] = [player[:drunk], 0].max
    else
      error_message
    end
  end

  print `clear`
end
