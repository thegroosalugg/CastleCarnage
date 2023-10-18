# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes

def invoice(who, what, where)
  item = who[:pouch].last # last added item
  item[:tag] = if item[:stat] == :attack || item[:stat] == :block # checks if item is attack/block
    item[:type] == :trap ? BUFFS[item[:stat]][:minus] : BUFFS[item[:stat]][:plus] # attack/block can be positive/negative
  elsif item[:stat] == :accuracy || item[:stat] == :crit_ch                       # correct tag is applied to attack/block
    BUFFS[item[:stat]]                         # accuracy is a nerf and crit ch is buff so the respective keys are applied
  end                                 # these check for pouch items or instant use hp and also given to enemy or to player
  pouch_item = what     == :pouch  ? "#{item[:phrase]} #{item[:tag]}" : "#{ITEMS.sample[:phrase]} +#{what} #{who[:emoji]}" # attaches correct tags
  pouch_trap = what     == :pouch  ? "#{item[:phrase]} #{item[:tag]}" : "#{TRAPS.sample[:phrase]} -#{what} #{who[:emoji]}"
  item_tag   = who[:id] == :player ?            "#{ITEM}"           :             "#{THIEF}"
  trap_tag   = who[:id] == :player ?            "#{DEBT}"           :             "#{TRAP}"

  x, messages = case where
  when :bounty then [90, "#{BONUS} #{who[:name]} +10 #{who[:emoji]} + 1 💵"]
  when :item   then [90, "#{item_tag} #{who[:name]} #{pouch_item}"]
  when :trap   then [90, "#{trap_tag} #{who[:name]} #{pouch_trap}"]
  # when :cash  then  [85, "#{CASH} +#{what} 💵"] # blackjack
  # when :loss  then  [85, "#{CASH} -#{what} 💵"] # blackjack
  # when :cards then  [110, "#{who[:name]} drew #{CARD} #{what.last[:suit]}"] # blackjack
  end
  puts text_break(messages, " ", x)
end
