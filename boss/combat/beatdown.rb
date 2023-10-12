# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def youre_barred(the_boss, player)
  if rand(the_boss[:accuracy]) == 1
    shots_fired(the_boss, player, :missed)
  else
    damage = (rand(the_boss[:attack]) + 10 - player[:cash] - rand(player[:block])).clamp(1, 100) # damage modified by cash, 10 is neutral
    player[:hp] -= damage
    shots_fired(the_boss, player, damage, :hit)
  end
end

def not_tonight(the_boss, player, weapon)
  if rand(the_boss[:accuracy]) <= (player[:sneaky] ? 2 : 1)        # attempting a sneak attack increases boss's miss chance by 1
    shots_fired(the_boss, player, :missed)                         # player drunkenness increases boss attack
  else                                                             # block upgraded by weapon durability
    guard = player[:sneaky] ? 0 : weapon[:durability] * rand(2..3) # no guard bonus for sneak attacks
    damage = (rand(the_boss[:attack]) + player[:drunk] - rand(player[:block]) + guard).clamp(1, 100)
    player[:hp] -= damage
    shots_fired(the_boss, player, damage, :hit)
    invoice(player, guard, :club) unless player[:sneaky] || weapon[:durability].zero?
  end
end

def xhardcorex(the_boss, player)
  if rand(the_boss[:accuracy]) == 1
    cash_lost = 0
    shots_fired(the_boss, player, :missed)
  else
    cash_lost = player[:cash].zero? ? 0 : rand(1..[player[:cash], 3].min)
    player[:cash] = (player[:cash] - cash_lost).clamp(0, 20) # boss gets damage boost multiplier x cash lost, if 0, multiplier is maxed
    damage = (rand(the_boss[:attack]) * (cash_lost.zero? ? 1.5 : (0.8 + cash_lost * 0.2)) - rand(player[:block])).to_i.clamp(1, 100)
    player[:hp] -= damage
    invoice(player, cash_lost, :xcore)
    shots_fired(the_boss, player, damage, :hit)
  end
  cash_lost # passes to mosh pit
end

def boss_strikes_back(the_boss, boss_style, player, weapon)
  case boss_style
  when "🍻 Barkeep" then youre_barred(the_boss, player)
  when "🕶️ Bouncer" then not_tonight(the_boss, player, weapon)
  when "🎶 Band"    then xhardcorex(the_boss, player)
  end
end

def boss_rage(player, buddy, the_boss)
  if the_boss[:rage] > 4
    if rand(3) == 1
      rage = rand(3..the_boss[:rage])
      the_boss[:rage] -= rage
      blast = (rand(6..10) * rage - rand(player[:block])).clamp(1, 100)
      target = buddy ? [player, buddy].sample : player
      target[:hp] -= blast
      boss_speaks(target, the_boss, blast, :hit)
    else
      boss_speaks(player, the_boss, blast, :threat)
    end
  end
end
