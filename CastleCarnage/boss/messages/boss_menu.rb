# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def boss_menu
  puts "----------------------------------------------------------------------"
  puts "     Decisions, decisions..."
  puts "[4] 👊⚡ Fight the Power"
  puts "[5] 🩸🪄 Blood Magic"
end

def player_status(player)
  wallet =
    case player[:cash]
    when 0..2   then "[    Skint af     🫥]"
    when 3..5   then "[   Pocket Money  🤔]"
    when 6..9   then "[ Got some Moolah 😐]"
    when 10..13 then "[     Sorted      🫠]"
    when 14..17 then "[   Filthy Rich   🤑]"
    when 18..20 then "[  Totally Minted 😈]"
    end

  drunk =
    case player[:drunk]
    when 0..2   then "[Sober as a Judge ⚖️]"
    when 3..5   then "[  Got a Buzz on  😉]"
    when 6..9   then "[  Feeling Tipsy  😏]"
    when 10..13 then "[ Out on the Razz 🥴]"
    when 14..17 then "[  Proper Pissed  🤤]"
    when 18..20 then "[  Fucking Wasted 😵]"
    end

  puts "    💰 #{wallet} [DEBUG #{player[:cash]}] #{'💵' * [player[:cash], 0].max}"
  puts "    🍻 #{drunk} [DEBUG #{player[:drunk]}] #{'🍺' * [player[:drunk], 0].max}"
end

def game_info(player, the_boss, boss_style, load_boss)
  puts "----------------------------------------------------------------------"
  puts "    #{player_bars(player)}"
  puts "    #{player_status(player)}"
  puts "----------------------------------------------------------------------"
  puts "    #{the_boss[:name]} HP: [#{the_boss[:hp].to_i}] #{'💜' * [(the_boss[:hp] - 1) / 50 + 1, 0].max}"
  puts "                💫 Style: #{boss_style}"
  puts "----------------------------------------------------------------------"
  puts load_boss
end

def fight_menu(boss_style)
  puts "----------------------------------------------------------------------"
  if boss_style == "🍻 Barkeep"
    puts "[4] 💴🗒️ Settle your Tabs"
    puts "[5] 🪑🤺 Old School Bar Fight"
  end
end

def blood_menu(player)
  poor = [
    "[5] 💵 Get Money",
  ]
  rich = [
    "--- You're too rich 💵. No more money for you ---",
  ]
  drunk = [
    "[6] 🥤 Bottle of Water and some 💊 Ibuprofen"
  ]
  sober = [
    "--- You're not even drunk 🍺🥴 ---"
  ]
  strong = [
    "[7] 🍔 Order a take away"
  ]
  weak = [
    "--- You're weak af bro, don't make me laugh 🤣 ---"
  ]

  puts "----------------------------------------------------------------------"
  puts "-------------- 🧞:'Pay with Blood ❤️ Get Bargains 💰'--------------"
  puts "[4] 💪 Buff up!"

  puts (player[:cash] < 20 ? poor.sample : rich.sample)
  puts (player[:drunk].positive? ? drunk.sample : sober.sample)
  puts (player[:block].max > 1 ? strong.sample : weak.sample)
end
