# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def boss_menu
  puts "----------------------------------------------------------------------"
  puts "     Decisions, decisions..."
  puts "[4] 👊⚡ Fight the Power"
  puts "[5] 🩸🪄 Blood Magic"
end

def game_info(player, the_boss, boss_style, load_boss)
  puts "----------------------------------------------------------------------"
  puts "    #{the_boss[:name]} HP: [#{the_boss[:hp].to_i}] #{'💜' * [(the_boss[:hp] - 1) / 50 + 1, 0].max}"
  puts "                💫 Style: #{boss_style}"
  puts "----------------------------------------------------------------------"
  puts "    #{player_bars(player)}"
  puts "    💰  Wallet: [DEBUG #{player[:cash]}] #{'💵' * [player[:cash], 0].max}"
  puts "    🥴🍾 Drunk: [DEBUG #{player[:drunk]}] #{'🍺' * [player[:drunk], 0].max}"
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
