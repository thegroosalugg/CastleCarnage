# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

SEPARATOR = "-" * 70
BARRIER = "~" * 50
ENEMY_DIV = " " * 4 + "_" * 66

# Main game menu

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
    "   💨 [y]: Dishonourable Discharge",
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

# Name your player

def name_player(player)
  title_screen
  puts " " * 26 + BARRIER
  puts " " * 42 + "Enter Your Name"
  puts " " * 26 + BARRIER
  your_name = gets.chomp.downcase.capitalize
  player[:name] = "🥷 #{your_name}"
  print `clear`
end

# UI Elements for Health, Attack, Block, Accuracy and Crit Chance for any entity
# \n represents line break when concatenating strings

def health_bars(entity)
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🤍", "🖤", "🤎", "💔", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]

  entity[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.

  "#{entity[:name]} / #{entity[:hp].to_i} #{entity[:emoji]} / #{"#{entity[:emoji]}" * [(entity[:hp] - 1) / 40 + 1, 0].max}"
end

def attack_stats(entity)
  "💢 Min " +
  "🔶" * (entity[:attack].min / 20) + ("🔸" * ((entity[:attack].min - 1) / 5 % 4 + 1)) +
  " Max " +
  "🔶" * (entity[:attack].max / 20) + ("🔸" * ((entity[:attack].max - 1) / 5 % 4 + 1))
end

def block_stats(entity)
  "🛡️ Min " +
  "🔷" * (entity[:block].min / 5) + "🔹" * (entity[:block].min % 5) +
  " Max " +
  "🔷" * (entity[:block].max / 5) + "🔹" * (entity[:block].max % 5)
end

def percentage(entity, key)
  accuracy = 100 - (100 / (entity[key.to_sym].max))
  crit_ch = 100 - accuracy
  key == :accuracy ? " / 🎯 #{accuracy}%" : " / 💥 #{crit_ch}%"
end

# Display generators that combine the above methods to create dynamic displays for enemy, player and weapon

def enemy_bars(enemy)
  "#{ENEMY_DIV}\n" +
  "    #{health_bars(enemy)}\n" +
  "    #{attack_stats(enemy)}" +
  "#{percentage(enemy, :crit_ch)}" +
  "#{percentage(enemy, :accuracy)} / " +
  "#{block_stats(enemy)}"
end

def weapon_bars(weapon)
  "#{BARRIER}\n" +
  "    #{weapon[:name]} / " +
  attack_stats(weapon) +
  "#{percentage(weapon, :crit_ch)}" +
  "#{percentage(weapon, :accuracy)}" +
  " / 🛠️ " +
  "🟦" * [weapon[:durability], 0].max
end

# Main UI that displays all current happenings, by chaining the above methods

def state_of_game(enemy, second_enemy, player, weapon)
  puts SEPARATOR
  puts "    #{health_bars(player)}"
  puts "    #{block_stats(player)}"
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
