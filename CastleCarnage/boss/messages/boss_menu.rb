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
    when 10..13 then "Out on the Razz  🥴 /"
    when 14..17 then " Proper Pissed   🤤 /"
    when 18..20 then " Fucking Wasted  😵 /"
    end

  "#{BARRIER}\n" +
  "    #{wallet} [DEBUG #{player[:cash]}] #{'💵' * [player[:cash], 0].max}\n" +
  "    #{drunk} [DEBUG #{player[:drunk]}] #{'🍺' * [player[:drunk], 0].max}"
end


# Main game display

# Player attack wasn't added until after the boss methods were created. It wasn't used in the main game.
# As such it is passed as a block to the original player_bars method and is only called when big_boss_battle is run

def attack_stats(player)
  "    💢 Min " +
  "🔶" * (player[:attack].min / 20) + "🔸" * (player[:attack].min / 5 % 4) +
  " Max " +
  "🔶" * (player[:attack].max / 20) + "🔸" * (player[:attack].max / 5 % 4) +
  " / 🛡️ Min "
end

def game_info(player, weapon, the_boss, boss_style, load_boss)
  puts SEPARATOR
  puts "    #{player_bars(player) { attack_stats(player) }}"
  puts "    #{weapon_bars(weapon)}" if weapon && weapon[:durability].positive? && boss_style == "🕶️ Bouncer"
  puts "    #{player_status(player)}"
  puts SEPARATOR
  puts "    #{the_boss[:name]} / #{boss_style} / #{the_boss[:hp].to_i} 💜 / #{'💜' * [(the_boss[:hp] - 1) / 50 + 1, 0].max}"
  puts SEPARATOR
  puts load_boss
end

# Menu when selecting Fight the Power

def fight_menu(player, boss_style, weapon)
  denied = [

  ]
  get_weapon = [
    "[4] ⚔️ Armoury"
  ]
  puts SEPARATOR
  case boss_style
  when "🍻 Barkeep"
    puts "[4] 💴🗒️ Settle your Tabs"
    puts "[5] 🪑🤺 Old School Bar Fight"
  when "🕶️ Bouncer"
    # puts (weapon? && player[:cash] < 5 ? denied.sample : get_weapon.sample)
    puts "[4] ⚔️ Armoury" unless weapon
    puts "[5] "
  end
end

# Menu when selecting Pay with Blood

def blood_menu(player)
  poor = [
    "[5] 💵 Get Money",
    "[5] 💵 Lottery Tickets",
  ]
  rich = [
    "--- You're too rich 💵 No more money for you ---",
    "------------- The Taxman Cometh 💵 -------------",
  ]
  drunk = [
    "[6] 🥤 Bottle of Water",
    "[6] 💊 Ibuprofen",
  ]
  sober = [
    "--------- You're not even drunk 🍺🥴 -----------",
    "------------ We Don't Have it 🚫 ---------------",
  ]
  strong = [
    "[7] 🍔 Order a take away",
    "[7] ⚖️ Attempt at life forever",
  ]
  weak = [
    "-- You're too feeble, don't make me laugh 🤣 --",
    "------------- Don't be Silly 🤣 ---------------",
  ]

  puts SEPARATOR
  puts "-------------- 🧞:'Pay with Blood ❤️ Get Bargains 💰'--------------"
  puts "[4] 💪 Buff up!"

  puts (player[:cash] < 20 ? poor.sample : rich.sample)
  puts (player[:drunk].positive? ? drunk.sample : sober.sample)
  puts (player[:attack].max > 1 || player[:block].max > 1 ? strong.sample : weak.sample)
end
