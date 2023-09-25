# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pay_with_blood(player, weapon, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5, 6, 7].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)

    puts "[DEBUG] attack #{player[:attack]} block #{player[:block]}"

    blood_menu(player)

    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      boost = [:attack, :block].sample
      price_paid = (boost == :attack ? (35..60) : (20..50)).to_a.sample
      player[:hp] -= price_paid
      player[boost] = player[boost].map { |stat| stat + 1 }
    when 5
      if player[:cash] < 20
        multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 8].min)
        price_paid = (multiplier * rand(9.0..11.0)).to_i
        player[:hp] -= price_paid
        player[:cash] += multiplier
      else
        error_message
        redo
      end
    when 6
      if player[:drunk].positive?
        multiplier = player[:drunk].zero? ? 0 : (1..player[:drunk]).to_a.sample
        price_paid = (multiplier * rand(5.0..10.0)).to_i
        player[:hp] -= price_paid
        player[:drunk] = (player[:drunk] - multiplier).clamp(0, 20)
        # player[:drunk] = [player[:drunk] - multiplier, 0].max
      else
        error_message
        redo
      end
    when 7
      if player[:block].max > 1
        multiplier = player[:block].max > 1 ? rand(1..[player[:block].max - 1, 4].min) : 0
        player[:block] = player[:block].map { |block| [block - multiplier, 1].max }
        price_paid = (10..40).to_a.sample * multiplier
        player[:hp] += price_paid
      else
        error_message
        redo
      end
    else
      error_message
    end
  end

  print `clear`

  puts "[DEBUG] attack #{player[:attack]} block #{player[:block]} boost #{boost}"
  
  paid_blood_message(user_choice, price_paid, multiplier, boost)
  boss_style = the_boss[:style].sample
end
