# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def get_buff(player)
  boost = [:attack, :block].sample
  price_paid = (boost == :attack ? (35..60) : (25..50)).to_a.sample
  multiplier = price_paid / rand(15..25)
  player[:hp] -= price_paid
  player[boost] = player[boost].map { |stat| [stat + multiplier, 80].min }
  return price_paid, multiplier, boost
end

def get_rich(player)
  multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 8].min)
  price_paid = (multiplier * rand(9.0..11.0)).to_i
  player[:hp] -= price_paid
  player[:cash] += multiplier
  return price_paid, multiplier
end

def sort_it_out(player)
  multiplier = player[:drunk].zero? ? 0 : (1..player[:drunk]).to_a.sample
  price_paid = (multiplier * rand(5.0..10.0)).to_i
  player[:hp] -= price_paid
  player[:drunk] = (player[:drunk] - multiplier).clamp(0, 20)
  return price_paid, multiplier
end

def munch_out(player)
  boost = [:attack, :block].select { |stat| player[stat].max > 1 }.sample

  multiplier = player[boost].max > 1 ? rand(1..[player[boost].max - 1, 4].min) : 0
  player[boost] = player[boost].map { |stat| [stat - multiplier, 1].max }

  price_paid = (25..50).to_a.sample * multiplier
  player[:hp] = [player[:hp] + price_paid, 1000].min
  return price_paid, multiplier, boost
end

def pay_with_blood(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)

    message = "[DEBUG] 💢 #{player[:attack].minmax.join('-')} 🛡️ #{player[:block].minmax.join('-')}" # DEBUGGING
    puts text_break(message, " ", 70) # DEBUGGING

    blood_menu(player)

    user_choice = gets.chomp.to_i
    case user_choice
    when 4 # spend HP to increase player attack or block randomly
      price_paid, multiplier, boost = get_buff(player)
    when 5 # spend HP to get cash
      if player[:cash] < 20
        price_paid, multiplier = get_rich(player)
      else
        error_message
        redo
      end
    when 6 # spend HP to decrease toxicity
      if player[:drunk].positive?
        price_paid, multiplier = sort_it_out(player)
      else
        error_message
        redo
      end
    when 7 # sacrifice attack or block to gain HP
      if (player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 1000
        price_paid, multiplier, boost = munch_out(player)
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
