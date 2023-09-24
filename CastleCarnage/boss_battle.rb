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
      multiplier = cash_spent.zero? ? 0.7 : 1.0 + (cash_spent * 0.5)
      the_boss[:hp] -= damage * multiplier
      player[:cash] -= cash_spent
      player[:drunk] = [player[:drunk] + cash_spent, 20].min
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

  until [4, 5, 6, 7].include?(user_choice)
    game_info(player, the_boss, boss_style, load_boss)
    blood_menu

    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      price_paid = (20..50).to_a.sample
      player[:hp] -= price_paid
      player[:block] = player[:block].map { |block| block + 1 }
    when 5
      multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 8].min)
      price_paid = (multiplier * rand(9.0..11.0)).to_i
      player[:hp] -= price_paid
      player[:cash] += multiplier
    when 6
      multiplier = player[:drunk].zero? ? 0 : (1..player[:drunk]).to_a.sample
      price_paid = (multiplier * rand(5.0..10.0)).to_i
      player[:hp] -= price_paid
      player[:drunk] = [player[:drunk] - multiplier, 0].max
    when 7
      multiplier = player[:block].max > 1 ? rand(1..[player[:block].max - 1, 4].min) : 0
      player[:block] = player[:block].map { |block| [block - multiplier, 1].max }
      price_paid = (10..40).to_a.sample * multiplier
      player[:hp] += price_paid
    else
      error_message
    end
  end

  print `clear`
  paid_blood_message(user_choice, price_paid, multiplier)
  boss_style = the_boss[:style].sample
end
