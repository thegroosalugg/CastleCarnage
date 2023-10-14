# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Main Menu

def boss_menu(player, boss_style)
  magic = "  🔥#{player[:emoji]} [y] 🪦🪄 Necromancy"
  t = 4 - player[:turns]
  n = t == 1 ? "next" : "in #{t}"
  s = t == 1 ? "" : "s"

  puts SEPARATOR
  puts "     Decisions, decisions..."
  puts "    ⚔️ [t] 👊⚡ Fight the #{boss_style}"
  puts "  🔥#{player[:emoji]} [r] 🩸🪄 Blood Magic"
  puts player[:turns] == 4 ? magic : padding_generator("⏱️ Available #{n} turn#{s}", "-", 50)
end

# Dynamic status for player cash & drunkness

def player_status(player)
  wallet = case player[:cash]
    when 0..2   then "    Skint AF     🫥 /"
    when 3..5   then "  Pocket Money   🤔 /"
    when 6..9   then " Got some Moolah 😐 /"
    when 10..13 then "     Sorted      🫠 /"
    when 14..17 then "  Filthy Rich    🤑 /"
    when 18..20 then " Totally Minted  😈 /"
    end

  drunk = case player[:drunk]
    when 0..2   then "Sober as a Judge ⚖️ /"
    when 3..5   then " Got a Buzz on   😉 /"
    when 6..9   then " Feeling Tipsy   😏 /"
    when 10..13 then " Out on the Razz 🥴 /"
    when 14..17 then " Proper Pissed   🤤 /"
    when 18..20 then " Fucking Wasted  😵 /"
    end

  "#{BARRIER}\n" +
  "    #{wallet} #{'💵' * [player[:cash], 0].max}\n" +
  "    #{drunk} #{'🍺' * [player[:drunk], 0].max}"
end

# boss rage bar

def rage(the_boss)
  "🐲" + "🔥" * [the_boss[:rage], 0].max
end

# the boss moves!

def move_ascii_art(load_boss) # added condition, if art is boss, it moves on each loop, if static, it centers art without hardcode
  vertical_offset = load_boss[:id] == :move ? rand(10..30) : 10
  load_boss[:art].split("\n").map { |line| " " * vertical_offset + line }.join("\n")
end

# Same as state of game but exclusively for big boss

def game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
  puts SEPARATOR
  puts "    #{health_bars(the_boss)}\n" + "\n"          # weird looking code makes font red
  puts "    #{boss_style} / #{attack_stats(the_boss)} / #{RAGE} #{rage(the_boss)}"
  puts BOSS_DIV
  puts move_ascii_art(load_boss)
  puts "    #{BARRIER}"
  puts "    #{enemy_bars(buddy)}" if buddy && buddy[:hp].positive?
  puts "    #{health_bars(player)}\n" + "\n"
  puts "    #{attack_stats(player)} / #{block_stats(player)}"
  puts "    #{weapon_bars(weapon)}" if weapon[:durability].positive? && boss_style == "🕶️ Bouncer"
  puts "    #{player_status(player)}"
end

# Menu when selecting Fight the Power

def barkeep(player)
  money_fight = [
    "  💵🍺 [4] 💴🗒️ Settle your Tabs",
  ]
  bar_fight = [
    "❄️💵🍺 [5] 🪑🤺 Old School Bar Fight",
  ]
  blackjack = [
    "🔥💵   [6] ♠️♥️ BlackJack ♦️♣️",
  ]

  puts money_fight.sample
  puts bar_fight.sample
  puts (player[:cash].positive? && player[:jacked] ? blackjack.sample : denied)
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
  puts SEPARATOR
  puts "    What's up, what's up..."
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

  puts SEPARATOR
  puts padding_generator(" 🧞💬 Pay with Blood ❤️ Get Bargains 💰 ", "💠", 57)
  puts (player[:attack].max < 50 || player[:block].max < 20 ? buffout.sample : denied)
  puts (player[:cash] < 20 ? money.sample : denied)
  puts (player[:drunk].positive? ? drink.sample : denied)
  puts ((player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 500 ? health.sample : denied)
  puts "   💨 [9] 🏃 Geeeet ooooout!"
end

# Same messages for both of the above menus.

def denied
  messages = [
    "Just No ⛔",
    "Get Lost ⛔",
    "Out of Stock ⛔",
    "We Don't Have It ⛔",
    "You Can't Have That ⛔",
  ]

  padding_generator(messages.sample, "-", 50)
end
