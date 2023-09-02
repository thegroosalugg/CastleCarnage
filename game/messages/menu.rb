# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def load_menu
  t = [
    "🐱‍👤 [t]: T is for time to die fucker!",
    "🐱‍👤 [t]: Punch him in his stupid ugly face",
    "🐱‍👤 [t]: Strike first! Strike hard! No mercy!",
    "🐱‍👤 [t]: Your soul is mine!",
    "🐱‍👤 [t]: Hadouken!",
    "🐱‍👤 [t]: Mash 'em up, innit",
  ]

  r = [
    "🐱‍🏍  [r]: Try a sommersault!",
    "🐱‍🏍  [r]: Do a backflip",
    "🐱‍🏍  [r]: Roundhouse!",
    "🐱‍🏍  [r]: Go Super Saiyan 😼",
    "🐱‍🏍  [r]: Parkour, parkour!",
    "🐱‍🏍  [r]: 🟪🟦🟥🟧🟨🟩",
    "🐱‍🏍  [r]: Do a Barrel Roll",
  ]

  y = [
    " 💨   [y]: Fuckin' leg it!",
    " 💨   [y]: Peg it!",
    " 💨   [y]: Cheese it!",
    " 💨   [y]: Run in the opposite direction!",
    " 💨   [y]: Melt out",
    " 💨   [y]: Skive off",
    " 💨   [y]: Mug it",
    " 💨   [y]: Bunk it",
    " 💨   [y]: 'Llow it!",
  ]

  puts "       Whatcha ya gonna do?"
  puts t.sample
  puts r.sample
  puts y.sample
end

# GAME STATUS

def state_of_game(enemy, second_enemy, player, weapon)
  puts "----------------------------------------------------------------------"
  puts "    #{enemy[:name]} HP: #{enemy[:hp.to_i]} #{'🤍' * (enemy[:hp] / 20)}" if enemy
  puts "    #{second_enemy[:name]} HP: #{second_enemy[:hp.to_i]} #{'🤍' * (second_enemy[:hp] / 20)}" if second_enemy
  puts "    💖 Your HP: #{player[:hp].to_i } #{'❤️' * (player[:hp] / 20)}"
  puts "    ⚔  Weapon: #{weapon[:name]}" if weapon[:durability] > 0
  # puts "    ⚔  Weapon: #{weapon[:name]} [DEBUG] [Durability: #{weapon[:durability]}]" if weapon[:durability] > 0
  puts "----------------------------------------------------------------------"
end

# ERROR MESSAGES

def error_message
  errors = [
    "***********************❌ Don't be a pillock ‼ ***********************",
    "***********************❌ Don't be a plum ‼ **************************",
    "***********************❌ Don't be a plank ‼ *************************",
    "***********************❌ Don't be a plonker ‼ ***********************",
    "***********************❌ Don't be a fool ‼ **************************",
    "***********************❌ Quit clowning around ‼ *********************",
    "***********************❌ Nobody likes a joker ‼ *********************",
    "***********************❌ Quit being a melon ‼ ***********************",
    "***********************❌ Quit faffing around ‼ **********************",
  ]

  print `clear`
  puts "----------------------------------------------------------------------"
  puts errors.sample
  puts "----------------------------------------------------------------------"
end
