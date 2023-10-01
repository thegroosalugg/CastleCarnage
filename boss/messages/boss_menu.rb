# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Main Menu

def boss_menu
  puts SEPARATOR
  puts "     Decisions, decisions..."
  puts "[4] 👊⚡ Fight the Power"
  puts "[5] 🩸🪄 Blood Magic"
end

# Dynamic status for player cash & drunkness

def player_status(player)
  wallet =
    case player[:cash]
    when 0..2   then "    Skint af     🫥 /"
    when 3..5   then "  Pocket Money   🤔 /"
    when 6..9   then " Got some Moolah 😐 /"
    when 10..13 then "     Sorted      🫠 /"
    when 14..17 then "  Filthy Rich    🤑 /"
    when 18..20 then " Totally Minted  😈 /"
    end

  drunk =
    case player[:drunk]
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

# the boss now moves!!

def move_ascii_art(load_boss)
  vertical_offset = (10..30).to_a.sample
  load_boss.split("\n").map { |line| " " * vertical_offset + line }.join("\n")
end

# Same as state_of_game but made exclusively for the big_boss

def game_info(player, weapon, the_boss, boss_style, load_boss)
  puts SEPARATOR
  puts "    #{health_bars(player)}"
  puts "    #{attack_stats(player)} / #{block_stats(player)}"
  puts "    #{weapon_bars(weapon)}" if weapon[:durability].positive? && boss_style == "🕶️ Bouncer"
  puts "    #{player_status(player)}"
  puts BOSS_DIV
  puts "    #{health_bars(the_boss)}"
  puts "    #{boss_style} / #{attack_stats(the_boss)}"
  puts SEPARATOR
  puts move_ascii_art(load_boss)
end

# Menu when selecting Fight the Power

def fight_menu(player, boss_style, weapon)
  denied = [
    "Don't get greedy ⛔",
  ]
  get_weapon = [
    "[4] ⚔️ Armoury",
  ]
  ranged_strike = [
    "[5] 🏹 Ranged Strike"
  ]
  weapon_strike = [
    "[6] ⚔️ Strike with #{weapon[:name]}"
  ]
  unarmed_strike = [
    "[6] 👊 Face Punch"
  ]
  sneak_attack = [
    "[7] 👟 Sneak Attack"
  ]

  puts SEPARATOR
  case boss_style
  when "🍻 Barkeep"
    puts "[4] 💴🗒️ Settle your Tabs"
    puts "[5] 🪑🤺 Old School Bar Fight"
  when "🕶️ Bouncer"
    puts (weapon[:durability].positive? || player[:cash] < 5 ? padding_generator(denied.sample, "-", 50) : get_weapon.sample)
    puts (weapon[:durability] < 3 ? padding_generator(denied.sample, "-", 50) : ranged_strike.sample)
    puts (weapon[:durability].positive? ? weapon_strike.sample : unarmed_strike.sample)
    puts sneak_attack.sample
  end
end

# Menu when selecting Pay with Blood

def blood_menu(player)
  always_open = [
    "   [4] 💪 Get Buff!",
    "   [4] 🏋️ Deadlift Regiment!",
    "   [4] 🫙 Creatine Monohydrate!",
  ]
  poor = [
    "   [5] 💵 Get Money",
    "   [5] 💵 Lottery Tickets",
    "   [5] 📓 Read the Necronomicon",
    "   [5] 😈 Deal with the Devil",
    "   [5] 🎰 Get Rich QUick Scheme",
  ]
  rich = [
    "You're too rich 💵 No more money for you",
    "The Taxman Cometh 💵",
    "Get Lost ⛔",
  ]
  drunk = [
    "   [6] 🥤 Bottle of Water",
    "   [6] 💊 Ibuprofen",
    "   [6] 🍕 Greasy Pizza",
    "   [6] 🎬 90's Action Movies",
    "   [6] 🥙 Döner Kebab"
  ]
  sober = [
    "You're not even drunk 🍺🥴",
    "We Don't Have it 🚫",
  ]
  strong = [
    "   [7] 🍔 Order a take away",
    "   [7] ⚖️ Live another day",
  ]
  weak = [
    "You're too feeble, don't make me laugh 🤣",
    "Don't be Silly 🤣",
  ]

  puts SEPARATOR
  puts padding_generator(" 🧞:'Pay with Blood ❤️ Get Bargains 💰' ", "💠", 57)
  puts always_open.sample
  puts (player[:cash] < 20 ? poor.sample : padding_generator(rich.sample, "-", 50))
  puts (player[:drunk].positive? ? drunk.sample : padding_generator(sober.sample, "-", 50))
  puts (player[:attack].max > 1 || player[:block].max > 1 ? strong.sample : padding_generator(weak.sample, "-", 50))
end
