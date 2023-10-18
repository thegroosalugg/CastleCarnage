# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes

def invoice(who, what, where)
  pouch_item = what     == :pouch  ? "#{who[:pouch].last[:phrase]}" : "#{ITEMS.sample[:phrase]} +#{what} #{who[:emoji]}"
  pouch_trap = what     == :pouch  ? "#{who[:pouch].last[:phrase]}" : "#{TRAPS.sample[:phrase]} -#{what} #{who[:emoji]}"
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
