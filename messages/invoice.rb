# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes
def invoice(who, what)
  size, messages = case what
  when :bounty then [90, "#{BONUS} #{who[:name]} +10 #{who[:emoji]} + 1 💵"]
  when :item   then [90, "#{who[:id] == :player ? ITEM : THIEF} #{who[:item][:name]} #{who[:name]} #{who[:item][:shout]}"]
  # when :cash  then  [85, "#{CASH} +#{what} 💵"] # blackjack
  # when :loss  then  [85, "#{CASH} -#{what} 💵"] # blackjack
  # when :cards then  [110, "#{who[:name]} drew #{CARD} #{what.last[:suit]}"] # blackjack
  end
  puts text_break(messages, " ", size)
end
