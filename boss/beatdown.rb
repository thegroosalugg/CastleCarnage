# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def youre_barred(the_boss, player)
  if the_boss[:accuracy].sample == 1
    missed(the_boss, player)
  else
    damage = (the_boss[:attack].sample + 10 - player[:cash] - player[:block].sample).clamp(0, 20)
    player[:hp] -= damage
    succesful_hit(the_boss, player, damage)
  end
end

def not_tonight(the_boss, player, weapon)
  if the_boss[:accuracy].sample == 1
    missed(the_boss, player)
  else
    guard = player[:sneaky] ? 0 : weapon[:durability] * rand(2..3)
    damage = (the_boss[:attack].sample - (player[:block].sample + guard)).clamp(0, 100)
    player[:hp] -= damage
    succesful_hit(the_boss, player, damage)
    invoice(player, guard, :club) unless player[:sneaky] || weapon[:durability].zero?
  end
end

def hardcore(the_boss, player)
  if the_boss[:accuracy].sample == 1
    missed(the_boss, player)
  else
    cash_lost = player[:cash].zero? ? 0 : rand(1..[player[:cash], 3].min)
    player[:cash] = (player[:cash] - cash_lost).clamp(0, 20)
    damage = (the_boss[:attack].sample * (cash_lost.zero? ? 1.3 : (0.9 + cash_lost * 0.1)) - player[:block].sample).to_i.clamp(0, 100)
    player[:hp] -= damage
    invoice(player, cash_lost, :pit)
    succesful_hit(the_boss, player, damage)
  end
end

def boss_strikes_back(the_boss, boss_style, player, weapon)
  case boss_style
  when "🍻 Barkeep" then youre_barred(the_boss, player)
  when "🕶️ Bouncer" then not_tonight(the_boss, player, weapon)
  when "🎶 Band"    then hardcore(the_boss, player)
  end
end
