# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Menu when selecting Fight the Power

def barkeep(player)
  blackjack = "🔥💵 #{SIX} ♠️♥️ \e[34mＢｌａｃｋＪａｃｋ\e[0m ♦️♣️"
  puts "  💵🍺 #{FOUR} 💴 \e[38;5;208mＰａｙ ｙｏｕｒ ｔａｂｓ\e[0m 🗒️"
  puts "❄️💵🍺 #{FIVE} 🪑 \e[32mＯｌｄ Ｓｃｈｏｏｌ Ｂａｒ Ｆｉｇｈｔ\e[0m 🤺"
  puts (player[:cash].positive? && player[:jacked] ? blackjack : denied)
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
  puts (weapon[:durability] > 2 ? ranged_strike.sample : denied)
  puts (weapon[:durability].zero? && player[:cash] > 4 ? get_weapon.sample : denied)
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
  puts BARRIER
  puts "    \e[31mⲰⲏⲁⲧ'𝛓 𐌵ⲣ, ⲱⲏⲁⲧ'𝛓 𐌵ⲣ...\e[0m"
  case boss_style
  when "🍻 Barkeep" then barkeep(player)
  when "🕶️ Bouncer" then bouncer(player, weapon)
  when "🎶 Band"    then band
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

  puts BARRIER
  puts padding_generator(" 🧞💬 Pay with Blood ❤️ Get Bargains 💰 ", "💠", 57)
  puts (player[:attack].max < 50 || player[:block].max < 20 ? buffout.sample : denied)
  puts (player[:cash] < 20 ? money.sample : denied)
  puts (player[:drunk].positive? ? drink.sample : denied)
  puts ((player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 100 ? health.sample : denied)
  puts "   💨 [9] 🏃 Geeeet ooooout!"
end
