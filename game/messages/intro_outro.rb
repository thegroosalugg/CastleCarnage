# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro_enemy(enemy)
  enemy_phrases = [
    "#{enemy[:name]} busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
    "You got proper pissed 🍷 and ended up in some 🏰 castle, a #{enemy[:name]} jumped from the ceiling, 'You goon get it now boy!'",
    "You got caught ganking 🍻 hooch from the 🏡 package store, the 👩🏿‍🤝‍🧑🏿👨🏽‍🤝‍👨🏼townsfolk set the #{enemy[:name]} on you!"
  ]

  puts enemy_phrases.sample
end

def intro_weapon(weapon, enemy)
  weapon_phrases = [
    "There's a #{weapon[:name]} on the floor, better get that. We won't get got, we gone get!",
    "You pull out your trusty #{weapon[:name]} from your trench coat and tip your fedora, 'The only thing sharper than my #{weapon[:name]} is my wit m'lady'",
    "You ✨teleport behind #{enemy[:name]} and withdraw your #{weapon[:name]}, 'Nothing personnel, kid'"
  ]

  puts weapon_phrases.sample
end

def end_game_art
puts <<-'ASCII'
                       _..gggggppppp.._
                  _.gd$$$$$$$$$$$$$$$$$$bp._
               .g$$$$$$P^^""j$$b""""^^T$$$$$$p.
            .g$$$P^T$$b    d$P T;       ""^^T$$$p.
          .d$$P^"  :$; `  :$;                "^T$$b.
        .d$$P'      T$b.   T$b                  `T$$b.
       d$$P'      .gg$$$$bpd$$$p.d$bpp.           `T$$b
      d$$P      .d$$$$$$$$$$$$$$$$$$$$bp.           T$$b
     d$$P      d$$$$$$$$$$$$$$$$$$$$$$$$$b.          T$$b
    d$$P      d$$$$$$$$$$$$$$$$$$P^^T$$$$P            T$$b
   d$$P    '-'T$$$$$$$$$$$$$$$$$$bggpd$$$$b.           T$$b
  :$$$      .d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p._.g.     $$$;
  $$$;     d$$$$$$$$$$$$$$$$$$$$$$$P^"^T$$$$P^^T$$$;    :$$$
 :$$$     :$$$$$$$$$$$$$$:$$$$$$$$$_    "^T$bpd$$$$,     $$$;
 $$$;     :$$$$$$$$$$$$$$bT$$$$$P^^T$p.    `T$$$$$$;     :$$$
:$$$      :$$$$$$$$$$$$$$P `^^^'    "^T$p.    lb`TP       $$$;
:$$$      $$$$$$$$$$$$$$$              `T$$p._;$b         $$$;
$$$;      $$$$$$$$$$$$$$;                `T$$$$:Tb        :$$$
$$$;      $$$$$$$$$$$$$$$                        Tb    _  :$$$
:$$$     d$$$$$$$$$$$$$$$.                        $b.__Tb $$$;
:$$$  .g$$$$$$$$$$$$$$$$$$$p...______...gp._      :$`^^^' $$$;
 $$$;  `^^'T$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p.    Tb._, :$$$
 :$$$       T$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$b.   "^"  $$$;
  $$$;       `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$b      :$$$
  :$$$        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;     $$$;
   T$$b    _  :$$`$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;   d$$P
    T$$b   T$g$$; :$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  d$$P
     T$$b   `^^'  :$$ "^T$$$$$$$$$$$$$$$$$$$$$$$$$$$ d$$P
      T$$b        $P     T$$$$$$$$$$$$$$$$$$$$$$$$$;d$$P
       T$$b.      '       $$$$$$$$$$$$$$$$$$$$$$$$$$$$P
        `T$$$p.   bug    d$$$$$$$$$$$$$$$$$$$$$$$$$$P'
          `T$$$$p..__..g$$$$$$$$$$$$$$$$$$$$$$$$$$P'
            "^$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$^"
               "^T$$$$$$$$$$$$$$$$$$$$$$$$$$P^"
                   """^^^T$$$$$$$$$$P^^^"""
                   ASCII
end

# END OF GAME MESSAGES

def win_message(enemy)
  win_messages = [
    "You blasted #{enemy[:name]} to another dimension. Your power level has increased.",
    "You splatted the #{enemy[:name]} like a bug, flawless victory.",
    "#{enemy[:name]} had a sudden heart attack, you win by default."
  ]

  puts win_messages.sample
  puts "----------------------------------------------------------------------"
  end_game_art
end

def lose_message(enemy)
  lose_messages = [
    "You Died! #{enemy[:name]} shall feast on your entrails.",
    "#{enemy[:name]} ripped your head off. You won't be coming home for dinner.",
    "You stacked it and fell on a spike. #{enemy[:name]} laughs at your misfortune."
  ]

  puts lose_messages.sample
  puts "----------------------------------------------------------------------"
  end_game_art
end
