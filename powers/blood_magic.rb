# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def blood_ritual(player, choice, price_paid, multiplier, boost)
  boost = boost == :attack ? "💢 attack" : "🛡️ block"

  buff =     "#{BUFF} +#{multiplier} #{boost}  #{HP_MINUS} -#{price_paid} #{player[:emoji]}"
  cash =     "#{CASH} +#{multiplier} 💵  #{HP_MINUS} -#{price_paid} #{player[:emoji]}"
  hangover = "#{HANGOVER} -#{multiplier} 🍺  #{HP_MINUS} -#{price_paid} #{player[:emoji]}"
  health =   "#{HP_PLUS} +#{price_paid} #{player[:emoji]}  #{HP_MINUS}  -#{multiplier} #{boost}"

  messages = case choice
  when 4 then buff
  when 5 then cash
  when 6 then hangover
  when 7 then health
  end
  puts text_break(messages, " ", 90)
end

def buffout(player)
  stats = []
  [player[:attack], player[:block]].each_with_index do |stat, index| # selects stats when attack < 50 || block < 20
    stats << :attack if index == 0 && stat.max < 50
    stats << :block if index == 1 && stat.max < 20
  end
  boost = stats.sample # nil value not possible, method call is guarded by same clause
  price_paid = rand(boost == :attack ? (25..50) : (15..40)) # higher price for attack
  multiplier = (price_paid / rand(7.5..15.0)).ceil # volume of boost also decided randomly .ceil rounds it up
  player[:hp] -= price_paid                                       # sets max range limits: attack: 50, block: 20
  player[boost] = (player[boost].min + multiplier / 2.0).ceil..[player[boost].max + multiplier, (boost == :attack ? 50 : 20)].min
  return price_paid, multiplier, boost             # minimum range gets 50% of maximum. 2.0 gives float and .ceil rounds floats up 1
end

def devils_deal(player)
  multiplier = player[:cash] >= 20 ? 0 : rand(1..[20 - player[:cash], 8].min)
  price_paid = (multiplier * rand(3.5..6.0)).to_i
  player[:hp] -= price_paid
  player[:cash] += multiplier
  return price_paid, multiplier
end

def hangover(player)
  multiplier = player[:drunk].zero? ? 0 : rand(1..[player[:drunk], 8].min)
  price_paid = (multiplier * rand(2.5..4.5)).to_i
  player[:hp] -= price_paid
  player[:drunk] = (player[:drunk] - multiplier).clamp(0, 20)
  return price_paid, multiplier
end

def dodgy_potion(player)
  boost = [:attack, :block].select { |stat| player[stat].max > 1 }.sample

  multiplier = player[boost].max > 1 ? rand(1..[player[boost].max - 1, 3].min) : 0
  player[boost] = [(player[boost].min - multiplier), 1].max..[player[boost].max - multiplier, 1].max

  price_paid = (rand(1..5) == 1 ? rand(40..60) : rand(20..40)) * multiplier
  player[:hp] = [player[:hp] + price_paid, 500].min
  return price_paid, multiplier, boost
end

def pay_with_blood(player, buddy, weapon, the_boss, boss_style, load_boss)
  choice = 0
  greeting(:shop)
  load_boss = the_shop

  until (4..7).include?(choice)
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
    blood_menu(player)

    choice = gets.chomp.to_i
    case choice
    when 4 # pay HP to increase player attack / block at random. Max 50 attack / 20 block range
      if player[:attack].max < 50 || player[:block].max < 20
      price_paid, multiplier, boost = buffout(player)
    else
      error(:wait)
      redo
    end
    when 5 # pay HP for cash: 0-20
      if player[:cash] < 20
        price_paid, multiplier = devils_deal(player)
      else
        error(:wait)
        redo
      end
    when 6 # pay HP to decrease toxicity: 20-0
      if player[:drunk].positive?
        price_paid, multiplier = hangover(player)
      else
        error(:wait)
        redo
      end
    when 7 # sacrifice attack / block for HP: 1000 max
      if (player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 100
        price_paid, multiplier, boost = dodgy_potion(player)
      else
        error(:wait)
        redo
      end
    when 9 then break
    else
      error(:input)
    end
  end

  print `clear`
  blood_ritual(player, choice, price_paid, multiplier, boost) unless choice == 9
  boss_style = choice == 9 ? boss_style : the_boss[:style].sample
  boss_walks(the_boss, boss_style, :outro) unless choice == 9
  boss_rage(player, buddy, the_boss) unless choice == 9
  return boss_style
end
