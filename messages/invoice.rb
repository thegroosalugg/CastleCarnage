# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def invoice(who, what) # controls all messages in the game except for combat
  tag = (who[:id] == :player ? (what == :got ? WEAPON : ITEM ) : THIEF) unless what == :room
  size, messages = case what
  when :escape   then [ 80, who[:name]    + " 💬 " +  RUN_SHOUT.sample]
  when :room     then [ 80, who[0][:name] + " 💬 " + ROOM_SHOUT.sample + " " + who[1][:name]]
  when :item     then [ 90, tag      + " " + who[:item][:name]          + " " + who[:name]       + " 💬 " + ITEM_SHOUT.sample ]
  when :broke    then [ 90, BROKE    + " " + who[:name] +   "'s"        + " " + who[:weapon][:name] + " " + BROKE_SHOUT.sample ]
  when :bounty   then [ 90, BONUS    + " " + who[:name] +   " +10 "     +       who[:emoji]         +   " + 1 💵" ]
  when :got      then [ 90, tag      + " " + who[:name] + " " +        GOT_SHOUT.sample             + " " + who[:weapon][:name] ]
  when :summon   then [100, SUMMON   + " " + who[:name] + " " +      SPAWN_SHOUT.sample]
  when :surprise then [100, SURPRISE + " " + who[:name] +         SURPRISE_SHOUT.sample]
  when :pwned    then [100, PWNED    + " " + who[:name] +            PWNED_SHOUT.sample]
  when :counter  then [100, COUNTER  + " " + who[:name] + " 🗯️ " + COUNTER_SHOUT.sample]
  end
  puts text_break(messages, " ", size)
end
