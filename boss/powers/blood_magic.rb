# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def get_buff(player)
  stats = []
  [player[:attack], player[:block]].each_with_index do |stat, index| # selects stats when attack < 50 || block < 25
    stats << :attack if index == 0 && stat.max < 50
    stats << :block if index == 1 && stat.max < 20
  end
  boost = stats.sample # nil value not possible, method call is guarded by same clause
  price_paid = rand(boost == :attack ? (35..60) : (25..50)) # higher price for attack
  multiplier = (price_paid / rand(15.0..25.0)).ceil # volume of boost also decided randomly .ceil rounds it up
  player[:hp] -= price_paid                                       # sets max range limits: attack: 50, block: 20
  player[boost] = (player[boost].min + multiplier)..[player[boost].max + multiplier, (boost == :attack ? 50 : 20)].min
  return price_paid, multiplier, boost
end

def get_rich(player)
  multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 12].min)
  price_paid = (multiplier * rand(2.5..5.0)).to_i
  player[:hp] -= price_paid
  player[:cash] += multiplier
  return price_paid, multiplier
end

def sort_it_out(player)
  multiplier = player[:drunk].zero? ? 0 : rand(1..player[:drunk])
  price_paid = (multiplier * rand(1.5..2.5)).to_i
  player[:hp] -= price_paid
  player[:drunk] = (player[:drunk] - multiplier).clamp(0, 20)
  return price_paid, multiplier
end

def munch_out(player)
  boost = [:attack, :block].select { |stat| player[stat].max > 1 }.sample

  multiplier = player[boost].max > 1 ? rand(1..[player[boost].max - 1, 4].min) : 0
  player[boost] = [(player[boost].min - multiplier), 1].max..[player[boost].max - multiplier, 1].max

  price_paid = (rand(1..5) == 1 ? rand(50..75) : rand(25..50)) * multiplier
  player[:hp] = [player[:hp] + price_paid, 1000].min
  return price_paid, multiplier, boost
end

def pay_with_blood(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0

  until (4..7).include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    blood_menu(player)

    user_choice = gets.chomp.to_i
    case user_choice
    when 4 # pay HP to increase player attack / block at random. Max 50 attack / 20 block range
      if player[:attack].max < 50 || player[:block].max < 20
      price_paid, multiplier, boost = get_buff(player)
    else
      error_message
      redo
    end
    when 5 # pay HP for cash: 0-20
      if player[:cash] < 20
        price_paid, multiplier = get_rich(player)
      else
        error_message
        redo
      end
    when 6 # pay HP to decrease toxicity: 20-0
      if player[:drunk].positive?
        price_paid, multiplier = sort_it_out(player)
      else
        error_message
        redo
      end
    when 7 # sacrifice attack / block for HP: 1000 max
      if (player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 1000
        price_paid, multiplier, boost = munch_out(player)
      else
        error_message
        redo
      end
    when 9 then break
    else
      error_message
    end
  end

  print `clear`
  paid_blood_message(player, user_choice, price_paid, multiplier, boost) unless user_choice == 9
  boss_style = user_choice == 9 ? boss_style : the_boss[:style].sample
  blue_steel(the_boss, boss_style, :outro) unless user_choice == 9
  return boss_style
end
