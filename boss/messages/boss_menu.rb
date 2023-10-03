# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Main Menu

def boss_menu(boss_style)
  puts SEPARATOR
  puts "     Decisions, decisions..."
  puts "[t] 👊⚡ Fight the #{boss_style}"
  puts "[r] 🩸🪄 Blood Magic"
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
  "    #{wallet} [DEBUG #{player[:cash]}] #{'💵' * [player[:cash], 0].max}\n" +
  "    #{drunk} [DEBUG #{player[:drunk]}] #{'🍺' * [player[:drunk], 0].max}"
end

# the boss moves!

def move_ascii_art(load_boss)
  vertical_offset = (10..30).to_a.sample
  load_boss.split("\n").map { |line| " " * vertical_offset + line }.join("\n")
end

# Same as state of game but exclusively for big boss

def game_info(player, weapon, the_boss, boss_style, load_boss)
  puts SEPARATOR
  puts "    #{health_bars(player)}\n" + "\n"
  puts "    #{attack_stats(player)} / #{block_stats(player)}"
  puts "    #{weapon_bars(weapon)}" if weapon[:durability].positive? && boss_style == "🕶️ Bouncer"
  puts "    #{player_status(player)}"
  puts BOSS_DIV
  puts "    #{health_bars(the_boss)}\n" + "\n"
  puts "    #{boss_style} / #{attack_stats(the_boss)}"
  puts SEPARATOR
  puts move_ascii_art(load_boss)
end

# Menu when selecting Fight the Power

def barkeep
  money_fight = [
    "[4] 💴🗒️ Settle your Tabs",
  ]
  bar_fight = [
    "[5] 🪑🤺 Old School Bar Fight",
  ]

  puts money_fight.sample
  puts bar_fight.sample
end

def bouncer(player, weapon)
  weapon_strike = [
    "[4] 💢 Strike with #{weapon[:name]}",
  ]
  unarmed_strike = [
    "[4] 👊 Face Punch",
  ]
  ranged_strike = [
    "[5] 🏹 Ranged Strike",
  ]
  get_weapon = [
    "[6] ⚔️ Armoury",
  ]
  sneak_attack = [
    "[7] 👟 Sneak Attack",
  ]

  puts (weapon[:durability].positive? ? weapon_strike.sample : unarmed_strike.sample)
  puts (weapon[:durability] > 2 ? ranged_strike.sample : denied)
  puts (weapon[:durability].zero? && player[:cash] > 4 ? get_weapon.sample : denied)
  puts sneak_attack.sample
end

def toilet_guy
end

def fight_menu(player, boss_style, weapon)
  puts SEPARATOR
  case boss_style
  when "🍻 Barkeep"
    barkeep
  when "🕶️ Bouncer"
    bouncer(player, weapon)
  when "🚾 Toilet Guy"
    toilet_guy
  end
end

# Menu when selecting Pay with Blood

def blood_menu(player)
  buffout = [
    "   [4] 💪 Get Buff!",
    "   [4] 🏋️ Deadlift Regiment!",
    "   [4] 🫙 Creatine Monohydrate!",
  ]
  money = [
    "   [5] 💵 Get Money",
    "   [5] 💵 Lottery Tickets",
    "   [5] 📓 Read the Necronomicon",
    "   [5] 😈 Deal with the Devil",
    "   [5] 🎰 Get Rich Quick Scheme",
  ]
  drink = [
    "   [6] 🥤 Bottle of Water",
    "   [6] 💊 Ibuprofen",
    "   [6] 🍕 Greasy Pizza",
    "   [6] 🎬 90's Action Movies",
    "   [6] 🥙 Döner Kebab"
  ]
  health = [
    "   [7] 🍔 Order a take away",
    "   [7] ⚖️ Live to fight another day",
  ]

  puts SEPARATOR
  puts padding_generator(" 🧞:'Pay with Blood ❤️ Get Bargains 💰' ", "💠", 57)
  puts (player[:attack].max < 50 || player[:block].max < 25 ? buffout.sample : denied)
  puts (player[:cash] < 20 ? money.sample : denied)
  puts (player[:drunk].positive? ? drink.sample : denied)
  puts ((player[:attack].max > 1 || player[:block].max > 1) && player[:hp] < 1000 ? health.sample : denied)
  puts "   [0] 🏃 Geeeet ooooout!"
end

# Same messages for both of the above menus.

def denied
  messages = [
    "Get Lost ⛔",
    "We Don't Have It ⛔",
    "Out of Stock ⛔",
    "Just No ⛔",
    "You Can't Have That ⛔",
  ]

  padding_generator(messages.sample, "-", 50)
end
