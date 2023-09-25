# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

SEPARATOR = "-" * 70
BARRIER = "~" * 49

def load_menu
  t = [
    "   🥷 [t]: Strike first! Strike hard! No mercy!",
    "   🥷 [t]: Punch 'em in their stupid ugly face",
    "   🥷 [t]: Challenge 'em to a thrashing",
    "   🥷 [t]: Saturday Night Square Up!",
    "   🥷 [t]: 'Peaceful' resolution",
    "   🥷 [t]: Talk about Fight Club",
    "   🥷 [t]: T is for time to die!",
    "   🥷 [t]: Mash 'em up, innit",
    "   🥷 [t]: Your soul is mine!",
    "   🥷 [t]: Pay 'em a beating",
    "   🥷 [t]: Choose violence",
    "   🥷 [t]: Do 'em in",
  ]

  r = [
    "   🐬 [r]: Try something, but probably fail",
    "   🐬 [r]: Last Chance Crusade",
    "   🐬 [r]: Do Something Stupid",
    "   🐬 [r]: Go Super Saiyan 😼",
    "   🐬 [r]: Try a sommersault!",
    "   🐬 [r]: Throw Pokéball 🚫",
    "   🐬 [r]: Parkour, parkour!",
    "   🐬 [r]: Do a Barrel Roll",
    "   🐬 [r]: 🟪🟦🟥🟧🟨🟩",
    "   🐬 [r]: Do a sick flip",
    "   🐬 [r]: Roundhouse!",
  ]

  y = [
    "   💨 [y]: Run in the opposite direction!",
    "   💨 [y]: Dishonourable discharge",
    "   💨 [y]: Fuckin' leg it!",
    "   💨 [y]: Look fo' swag",
    "   💨 [y]: Cheese it!",
    "   💨 [y]: Skive off",
    "   💨 [y]: 'llow it!",
    "   💨 [y]: Melt out",
    "   💨 [y]: Peg it!",
    "   💨 [y]: Bunk it",
    "   💨 [y]: Bounce",
    "   💨 [y]: Mug it",
  ]

  puts "       Whatcha ya gonna do?"
  puts t.sample
  puts r.sample
  puts y.sample
end

# GAME STATUS
# \n indicates a line break

def enemy_bars(enemy)
  "#{SEPARATOR[0..-5]}\n" +
  "    #{enemy[:name]} / #{enemy[:hp].to_i} 🤍 / #{'🤍' * [(enemy[:hp] - 1) / 25 + 1, 0].max}\n" +
  "    💢 Min " +
  "🔶" * (enemy[:attack].min / 20) + "🔸" * (enemy[:attack].min / 5 % 4) +
  " Max " +
  "🔶" * (enemy[:attack].max / 20) + "🔸" * (enemy[:attack].max / 5 % 4) +
  " / 🛡️ Min " +
  "🔷" * (enemy[:block].min / 5) + "🔹" * (enemy[:block].min % 5) +
  " Max " +
  "🔷" * (enemy[:block].max / 5) + "🔹" * (enemy[:block].max % 5)
end

def weapon_bars(weapon)
  "#{BARRIER}\n" +
  "    #{weapon[:name]}" +
  " 💢 Min " +
  "🔶" * (weapon[:damage].min / 20) + "🔸" * (weapon[:damage].min / 5 % 4) +
  " Max " +
  "🔶" * (weapon[:damage].max / 20) + "🔸" * (weapon[:damage].max / 5 % 4) +
  " / 🛠️ " +
  "🟦" * [weapon[:durability], 0].max
end

# Player attack wasn't added until after the boss methods were created. It wasn't used in the main game.
# As such it is passed as a block to the original player_bars method and is only called when big_boss_battle is run

def player_bars(player, &block)
  "🥷 You / #{player[:hp].to_i} ❤️ / #{'❤️' * [(player[:hp] - 1) / 25 + 1, 0].max}\n" +

  (block_given? ? yield : "    🛡️ Min ") +

  "🔷" * (player[:block].min / 5) + "🔹" * (player[:block].min % 5) +
  " Max " +
  "🔷" * (player[:block].max / 5) + "🔹" * (player[:block].max % 5)
end

def state_of_game(enemy, second_enemy, player, weapon)
  puts SEPARATOR
  puts "    #{player_bars(player)}"
  puts "    #{weapon_bars(weapon)}" if weapon && weapon[:durability].positive?
  puts "    #{enemy_bars(enemy)}" if enemy
  puts "    #{enemy_bars(second_enemy)}" if second_enemy
  puts SEPARATOR
end

# ERROR MESSAGES

def error_message
  errors = [
    "❌ Don't be a pillock ‼",
    "❌ Don't be a plonker ‼",
    "❌ Don't be a plank ‼",
    "❌ Don't be a plum ‼",
    "❌ Don't be a fool ‼",
    "❌ Nobody likes a joker ‼",
    "❌ Quit clowning around ‼",
    "❌ Quit faffing around ‼",
    "❌ Quit being a melon ‼",
  ]

  left_padding = '*' * 23
  error = errors.sample
  right_padding = '*' * (44 - error.length)

  print `clear`
  puts SEPARATOR
  puts "#{left_padding} #{error} #{right_padding}"
end
