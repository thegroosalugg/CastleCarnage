# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def shout(who, what) # controls all messages in the game except for combat
  tag = (who[:id] == :player ? (what == :got ? WEAPON : ITEM ) : THIEF)
  size, messages = case what
  when :name     then [110, ERRORS.sample  + " " +    WRONG]
  when :intro    then [ 60, [who[:tracking][:name] + " " + INTRO_SHOUT.sample,  who[:name] + " " + INTRO_CALLBACK.sample].join("\n")]
  when :bounce   then [ 85, who[:flip] == 1      ?   "#{SUCCESS} "     +"⚔️ "* who[:roll] : "#{FLUNKED} " + "😓 " * who[:roll]]
  when :escape   then [ 80, who[:name]    +" 💬 "+   RUN_SHOUT.sample]
  when :room     then [ 80, who[:name]    +" 💬 "+   ROOM_SHOUT.sample + " " +  who[:room][:name]]
  when :item     then [ 90, tag      + " " + who[:item][:name]          + " " + who[:name]         +" 💬 "+ ITEM_SHOUT.sample ]
  when :broke    then [ 90, BROKE    + " " + who[:name] +   "'s"        + " " + who[:weapon][:name] + " " + BROKE_SHOUT.sample ]
  when :bounty   then [ 90, BONUS    + " " + who[:name] +   " +10 "     +       who[:emoji]         +   " + 1 💵" ]
  when :got      then [ 90, tag      + " " + who[:name] + " " +        GOT_SHOUT.sample             + " " + who[:weapon][:name] ]
  when :error    then [ 80, WRONG    + " " + who[:name] + " " +           ERRORS.sample]
  when :summon   then [100, SUMMON   + " " + who[:name] + " " +      SPAWN_SHOUT.sample]
  when :surprise then [100, SURPRISE + " " + who[:name] +         SURPRISE_SHOUT.sample]
  when :pwned    then [100, PWNED    + " " + who[:name] +            PWNED_SHOUT.sample]
  when :counter  then [100, COUNTER  + " " + who[:name] +" 🗯️ "+   COUNTER_SHOUT.sample]
  when :combat   then [100, COMBAT   + " " + who[:name] +" 🗯️ "+    COMBAT_SHOUT.sample]
  end
  print `clear` if [:name, :error].include?(what)
  puts text_break(messages, " ", size)
end
