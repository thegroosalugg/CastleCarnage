# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_power(player, the_boss, boss_style)
  print `clear`

  case boss_style
  when "🍻 Barkeep"
    multiplier = rand(1.5..2.5)
  when "⚡ Electric"
    multiplier = rand(1.0..1.4)
  when "💧 Water"
    multiplier = rand(0.4..0.8)
  else
    multiplier = 1.0
  end

  damage = [(40..70).to_a.sample - the_boss[:block].sample, 1].max * multiplier

  the_boss[:hp] -= damage
  player[:hp] -= damage if boss_style == "⚡ Electric"
  damage_info(the_boss, boss_style, damage, multiplier)
  boss_style = the_boss[:style].sample
end

def pay_with_blood(player)
  print `clear`
  player[:hp] -= (20..50).to_a.sample
  player[:block] = player[:block].map { |block| block + 1 }
end