# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pay_with_blood(player, weapon, the_boss, boss_style, load_boss)

  user_choice = 0

  until [4, 5, 6, 7].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)

    message = "[DEBUG] 💢 #{player[:attack].minmax.join('-')} 🛡️ #{player[:block].minmax.join('-')}" # DEBUGGING
    puts text_break(message, " ", 70) # DEBUGGING

    blood_menu(player)

    user_choice = gets.chomp.to_i

    case user_choice
    when 4 # spend HP to increase player attack or block randomly
      boost = [:attack, :block].sample
      price_paid = (boost == :attack ? (35..60) : (20..50)).to_a.sample
      multiplier = price_paid / rand(15..25)
      player[:hp] -= price_paid
      player[boost] = player[boost].map { |boost| [boost + multiplier, 80].min }
    when 5 # spend HP to get cash
      if player[:cash] < 20
        multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 8].min)
        price_paid = (multiplier * rand(9.0..11.0)).to_i
        player[:hp] -= price_paid
        player[:cash] += multiplier
      else
        error_message
        redo
      end
    when 6 # spend HP to decrease toxicity
      if player[:drunk].positive?
        multiplier = player[:drunk].zero? ? 0 : (1..player[:drunk]).to_a.sample
        price_paid = (multiplier * rand(5.0..10.0)).to_i
        player[:hp] -= price_paid
        player[:drunk] = (player[:drunk] - multiplier).clamp(0, 20)
      else
        error_message
        redo
      end
    when 7 # sacrifice attack or block to gain HP
      if player[:block].max > 1 || player[:attack].max > 1
        boost = [:attack, :block].select { |stat| player[stat].max > 1 }.sample

        multiplier = player[boost].max > 1 ? rand(1..[player[boost].max - 1, 4].min) : 0
        player[boost] = player[boost].map { |boost| [boost - multiplier, 1].max }

        price_paid = (20..40).to_a.sample * multiplier
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

  second_message = "[DEBUG] 💢 #{player[:attack].minmax.join('-')} 🛡️ #{player[:block].minmax.join('-')} 🚀 #{boost} ❌ [#{multiplier}] 💲#{[price_paid]}" # DEBUGGING
  puts text_break(second_message, " ", 70) # DEBUGGING

  paid_blood_message(player, user_choice, price_paid, multiplier, boost)
  boss_style = the_boss[:style].sample
end
