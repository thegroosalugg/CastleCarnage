# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def item_used(who) # display for used item effects
  tags = who[:item].map do |key, value|
    if key == :name # name displays only value
      "#{who[:name]} 🥄#{value} 🥣 "
    else # everything else is checked for positive so + can be displayed
      gain = value.positive? ? "+#{value}" : value
      "#{BUFFS[key]}#{gain} " # each key corresponds to lambda hash and prints an ASCII tag
    end
  end
  tags.join(" ")
end

def shout(who, what) # controls all messages in the game except for combat
  tag = (who[:id] == :player ? (what == :got ? WEAPON : ITEM ) : THIEF)
  size, messages = case what
  when :used     then [100, item_used(who)]
  when :name     then [ 85,      ERRORS.sample  +   " "  + WRONG ]
  when :bounce   then [ 85, who[:flip]  == 1 ? "#{SUCCESS} " + "⚔️ " * who[:roll] : "#{FLUNKED}" + "😓 " * who[:roll] ]
  when :outro    then [ 80, who[:tracks][:name] +   " "  + (who[:hp].positive? ? WIN_SHOUT : LOSE_SHOUT).sample ]
  when :intro    then [ 60,[who[:tracks][:name] +   " "  + INTRO_SHOUT.sample, who[:name] +  " "  + INTRO_CALLBACK.sample].join(" ") ]
  when :goodbye  then [ 85,          who[:name] + " 💬 " + GOODBYE.sample ]
  when :escape   then [ 90,          who[:name] + " 💬 " + RUN_SHOUT.sample ]
  when :room     then [ 90,          who[:name] + " 💬 " + ROOM_SHOUT.sample  + " " + who[:room][:name] ]
  when :level    then [120,          who[:name] +   " "  +     LEVEL  +       " #{BL}#{who[:level]}#{CL} "  +  " #{BUFFS[who[:boost]]} " + "+#{who[:gains]}" ]
  when :wasted   then [100,              WASTED +   " "  + who[:name] ]
  when :sober    then [100,            HANGOVER +   " "  + who[:name] + " 🍺-1" ]
  when :cards    then [105,                CARD +   " "  + who[:name] +  " "   + who[:hand].last[:suit] ]
  when :target   then [ 90,              TARGET +   " "  + who[:name] + (who[:item]   ? " #{who[:item][:name]}" : "") ]
  when :shop     then [ 90,                SHOP +   " "  + who[:name] + " 💵-#{who[:cash]} " + "#{who[:emoji]}+#{who[:gains]}" ]
  when :bounty   then [115,               BONUS +   " "  + who[:name] + " #{who[:emoji]}+10"  + "  💵+1" + "  🍺-1  #{GN}+10#{CL}#{XP}"]
  when :broke    then [100,               BROKE +   " "  + who[:name] +  "'s " +       who[:weapon][:name]  +  " "    + BROKE_SHOUT.sample ]
  when :item     then [100,                 tag +   " "  + who[:item][:name]   + " " + who[:name]           + " 💬 " +  ITEM_SHOUT.sample ]
  when :got      then [100,                 tag +   " "  + who[:name] +  " "   +        GOT_SHOUT.sample    +  " "   + who[:weapon][:name] ]
  when :ganked   then [ 90,              GANKED +   " "  + who[:name] + " 🗯️ " +     GANKED_SHOUT.sample   +  " "   +  who[:ganked][:name] ]
  when :beers    then [100,            HANGOVER +   " "  + who[:name] + (rand(2) == 1 ? BEER_SHOUT.sample : "") + " 🍺+1" ]
  when :summon   then [100,              SUMMON +   " "  + who[:name] +  " "   +       SPAWN_SHOUT.sample ]
  when :surprise then [100,            SURPRISE +   " "  + who[:name] +             SURPRISE_SHOUT.sample ]
  when :pwned    then [100,               PWNED +   " "  + who[:name] +                PWNED_SHOUT.sample ]
  when :error    then [ 90,               WRONG +   " "  + who[:name] + " 🗯️ " +           ERRORS.sample ]
  when :counter  then [100,             COUNTER +   " "  + who[:name] + " 🗯️ " +    COUNTER_SHOUT.sample ]
  when :combat   then [100,              COMBAT +   " "  + who[:name] + " 🗯️ " +     COMBAT_SHOUT.sample ]
  else                [ 90,       ATTACKS[what] +   " "  + who[:name] + " 🗯️ " +       GAME_SHOUT.sample ]
  end
  print `clear`                            if [:error, :name].include?(what)
  puts " " * 23 + messages                 if [:error, :target, :combat].include?(what)
  puts text_break(messages, " ", size) unless [:error, :target, :combat].include?(what)
  puts SHIELD                              if what == :target
end
