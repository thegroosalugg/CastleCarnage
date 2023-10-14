# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def pay_the_tab(player, the_boss)
  cash_spent = player[:cash].zero? ? 0 : rand(1..[player[:cash], 6].min)
  multiplier = cash_spent.zero? ? 0.6 : 1.0 + (cash_spent * 0.5) # don't go to the bar with no money
  damage = (rand(player[:attack]) * (100 - player[:drunk] * 5) / 100 * multiplier).to_i.clamp(1, 150)

  the_boss[:hp] -= damage
  player[:cash] -= cash_spent
  player[:drunk] = (player[:drunk] + cash_spent).clamp(0, 20)

  invoice(player, cash_spent, :bar, :lost) unless cash_spent.zero?
  shots_fired(player, the_boss, damage, :hit)
end

def bar_fight(player, the_boss)
  beers = player[:drunk].zero? ? [2, 3].sample : [-2, -1, 1, 2, 3].sample # don't go to the bar with no beers
  wallet = player[:cash] >= 20 ? [-2, -3].sample : [-3, -2, -1, 1, 2].sample # don't go to the bar with a full wallet

  player[:drunk] = (player[:drunk] + beers).clamp(0, 20)
  player[:cash] = (player[:cash] + wallet).clamp(0, 20)

  damage = (rand(player[:attack]) * (100 - player[:drunk] * 5) / 100).to_i.clamp(1, 100) # updates damage to current drunkenness
  the_boss[:hp] -= damage

  invoice(player, [beers, wallet], :brawl)
  shots_fired(player, the_boss, damage, :hit)
end

def fight_the_barkeep(player, buddy, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  player[:jacked] = true
  load_boss = the_barkeep
  boss_walks(the_boss, boss_style, :intro)

  until (4..6).include?(user_choice)
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    case user_choice
    when 4
      print `clear`
      pay_the_tab(player, the_boss)
    when 5
      print `clear`
      bar_fight(player, the_boss)
      the_boss[:rage] = (the_boss[:rage] - 1).clamp(0, 10)
    when 6 # print `clear` exists inside the method
      if player[:cash].positive? && player[:jacked]
        player[:jacked] = false # disable game till next round
        the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
        blackjack(player, buddy, weapon, the_boss, boss_style, load_boss)
        redo
      else
        error_message
        redo
      end
    else
      error_message
    end
  end

  strike(buddy, the_boss) if buddy && rand(2) == 1
  boss_strikes_back(the_boss, boss_style, player, buddy, weapon) if the_boss[:hp].positive?
  boss_style = the_boss[:style].sample
  boss_walks(the_boss, boss_style, :outro) if the_boss[:hp].positive?
  return boss_style
end
