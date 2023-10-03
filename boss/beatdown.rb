# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def youre_barred(the_boss, player)
end

def not_tonight(the_boss, player, weapon)
end

def hardcore(the_boss, player)
end

def boss_strikes_back(the_boss, boss_style, player, weapon)
  case boss_style
  when "🍻 Barkeep" then youre_barred(the_boss, player)
  when "🕶️ Bouncer" then not_tonight(the_boss, player, weapon)
  when "🎶 Band"    then hardcore(the_boss, player)
  end
end
