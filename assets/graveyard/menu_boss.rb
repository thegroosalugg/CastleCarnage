# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Boss Menu

def boss_menu(player, boss_style)
  turns = 4 - player[:turns] # this counts how many turns remaining and adjusts message on final turn
  word = turns == 1 ? "ɴᴇxᴛ" : "ɪɴ #{turns}"
  s = turns == 1 ? "" : "s"
  magic = "🔥#{player[:emoji]} #{MG}[̝̻͕Y͔̻̦]͔̞ 🪦 Ⲛⲉⲥꞅⲟⲙⲁⲛⲥⲩ#{CL}  🪄"
  wait =  "⏱️ #{MG}Aᴠᴀɪʟᴀʙʟᴇ #{word} ᴛᴜʀɴ#{s}#{CL}"

  puts " " * 24 + "#{ML}Dᴇᴄɪsɪᴏɴs, ᴅᴇᴄɪsɪᴏɴs...#{CL}"
  puts " " * 20 + "⚔️ #{BL}[̿̓͐T͆͑͘]̒͠ 💀 𝓕ⲁⲥⲉ ⲧⲏⲉ​#{CL}#{STYLE[boss_style]} 🌘"
  puts " " * 18 + "🔥#{player[:emoji]} #{RD}[͋͊͒Ŕ́͝]͆̿ 🩸 Ⲃ𝓛ⲟⲟⲆ Ⲙⲁ𝓖ⲓⲕ#{CL} 🪄"
  puts " " * 18 + (player[:turns] == 4 ? magic : padding_generator(wait, "#{MG}#{ICONS.sample}#{CL}", 50))
  puts BARRIER
end

def rage(the_boss) # boss rage bar
  "#{RAGE}" + "🪔" * [the_boss[:rage], 0].max
end

# Menu when selecting Fight the Power

def barkeep(player)
  blackjack = "🔥💵   #{BL}#{NUM[6]} ♠️♥️ ＢｌａｃｋＪａｃｋ ♦️♣️#{GN}"
  puts "  💵🍺 #{OR}#{NUM[4]}  💴  Ｐａｙ ｙｏｕｒ ｔａｂｓ 🗒️#{GN}"
  puts "❄️💵🍺 #{GN}#{NUM[5]}  🪑  Ｏｌｄ Ｓｃｈｏｏｌ Ｂａｒ Ｆｉｇｈｔ 🚬#{GN}"
  puts (player[:cash].positive? && player[:jacked] ? blackjack : error(:denied))
end

def bouncer(player, weapon)
  weapon_strike = [
    "     [4] 💢 Strike with #{weapon[:name]}",
  ]
  unarmed_strike = [
    "  ❄️ [4] 👊 Face Punch",
  ]
  ranged_strike = [
    "  🔥 [5] 🏹 Ranged Strike",
  ]
  get_weapon = [
    "💵🔥 [6] ⚔️ Armoury",
  ]
  sneak_attack = [
    "  🔥 [7] 👟 Sneak Attack",
  ]

  puts (weapon[:durability].positive? ? weapon_strike.sample : unarmed_strike.sample)
  puts (weapon[:durability] > 2 ? ranged_strike.sample : error(:denied))
  puts (weapon[:durability].zero? && player[:cash] > 4 ? get_weapon.sample : error(:denied))
  puts sneak_attack.sample
end

def band
  mosh_pit = [
    " 💵❄️ [4] ✖️ Mosh Pit",
  ]
  dance_off = [
    "   🔥 [5] 🪩 Dance Off",
  ]
  keg_stand = [
    " 🍺🔥 [6] 🍺 Keg Stand",
  ]

  puts mosh_pit.sample
  puts dance_off.sample
  puts keg_stand.sample
end

def fight_menu(player, boss_style, weapon)
  puts "    #{ML}Ⲱⲏⲁⲧ'𝛓 𐌵ⲣ, ⲱⲏⲁⲧ'𝛓 𐌵ⲣ...#{CL}"
  case boss_style
  when :barkeep then barkeep(player)
  when :bouncer then bouncer(player, weapon)
  when :band    then band
  end
end

# Menu when selecting Pay with Blood

def blood_menu(player)
  buffout = [
    " 💢🛡️ [4] 💪 Get Buff!",
    " 💢🛡️ [4] 🏋️ Deadlift Regiment!",
    " 💢🛡️ [4] 🫙 Creatine Monohydrate!",
  ]
  money = [
    "   💵 [5] 💵 Gimme Money",
    "   💵 [5] 🎴 Scratchards",
    "   💵 [5] 💰 Rob a bank",
    "   💵 [5] 😈 Deal with Devil",
    "   💵 [5] 🎰 Pyramid Scheme",
  ]
  drink = [
    "   🍺 [6] 🥤 Bottle of Water",
    "   🍺 [6] 💊 Ibuprofen",
    "   🍺 [6] 🍕 Greasy Pizza",
    "   🍺 [6] 🎬 90's Action Movies",
    "   🍺 [6] 🥙 Döner Kebab"
  ]
  health = [
    "   #{player[:emoji]} [7] 🍔 Cheat Day",
    "   #{player[:emoji]} [7] 🧵 Hang on by a thread",
    "   #{player[:emoji]} [7] 🥣 Dodgy Looking Potion",
  ]

  puts padding_generator(" 🧞💬 Pay with Blood ❤️ Get Bargains 💰 ", "💠", 57)
  puts (player[:attack].max < 50 || player[:block].max < 20 ? buffout.sample : error(:denied))
  puts (player[:cash] < 20 ? money.sample : error(:denied))
  puts (player[:drunk].positive? ? drink.sample : error(:denied))
  puts ((player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 100 ? health.sample : error(:denied))
  puts "   💨 [9] 🏃 Geeeet ooooout!"
end
