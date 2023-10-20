# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Invoice for stat changes
def invoice(who, what)
  size, messages = case what
  when :escape   then [ 80, "💬 " + RUN_SHOUT.sample]
  when :item     then [ 90, (who[:id] == :player ? ITEM : THIEF) + " " + who[:item][:name]   + " " + who[:name] + " 💬 " + who[:item][:shout] ]
  when :broke    then [ 90, BROKE    + " " + who[:name] + "'s"   + " " + who[:weapon][:name] + " " + BROKE_SHOUT.sample ]
  when :bounty   then [ 90, BONUS    + " " + who[:name] + " +10 " + who[:emoji]  + " + 1 💵" ]
  when :got      then [ 90, WEAPON   + " " + who[:name] + " " + GOT_SHOUT.sample + " " + who[:weapon][:name] ]
  when :summon   then [100, SUMMON   + " " + who[:name] + " " + SPAWN_SHOUT.sample ]
  when :surprise then [100, SURPRISE + " " + who[:name] + SURPRISE_SHOUT.sample]
  when :pwned    then [100, PWNED    + " " + who[:name] + PWNED_SHOUT.sample]
  when :counter  then [100, COUNTER  + " " + who[:name] + " 🗯️ " + COUNTER_SHOUT.sample]

  # when :cash  then  [85, "#{CASH} +#{what} 💵"] # blackjack
  # when :loss  then  [85, "#{CASH} -#{what} 💵"] # blackjack
  # when :cards then  [110, "#{who[:name]} drew #{CARD} #{what.last[:suit]}"] # blackjack
  end
  puts text_break(messages, " ", size)
end
