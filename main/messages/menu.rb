# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# various ASCII separators

SEPARATOR = "⚔" * 80
BARRIER = "〰" * 38
ENEMY_DIV = "🗡" * 76
BOSS_DIV = " " * 4 + "▪" * 76

# In game display tags

HANGOVER = "\e[38;5;208mℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ\e[0m"
BONUS = "\e[37mＢＯＮＵＳ\e[0m"
BUFF = "\e[36m𝓑𝓤𝓕𝓕\e[0m"
HP_PLUS = "\e[32m𝙃𝙋\e[0m"
HP_MINUS = "\e[31m𝙃𝙋\e[0m"
ENEMY_HP = "\e[31m𝕰𝖓𝖊𝖒𝖞\e[0m"
ENEMY_TRAP = "\e[32m𝕰𝖓𝖊𝖒𝖞\e[0m"
WEAPON = "\e[38;5;208m𝓦𝓔𝓐𝓟𝓞𝓝\e[0m"
BROKE = "\e[31m𝐁𝐑𝐎𝐊𝐄\e[0m"
RAGE = "\e[38;5;208mR̷A̷G̷E̷\e[0m"
CRITICAL = "\e[38;5;208m𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻\e[0m"
MISSED = "\e[34m𝙼𝙸𝚂𝚂\e[0m"
HIT = "\e[31m𝙷𝙸𝚃\e[0m"
COUNTER = "\e[36mℂ𝕆𝕌ℕ𝕋𝔼ℝ\e[0m"
SUCCESS = "\e[32m𝓢𝓤𝓒𝓒𝓔𝓢𝓢\e[0m"
STACKED_IT = "\e[31m𝓢𝓣𝓐𝓒𝓚𝓔𝓓 𝓘𝓣\e[0m"
SUMMON = "\e[35m𝓢𝓤𝓜𝓜𝓞𝓝\e[0m"
SURPRISE = "\e[33m𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌\e[0m"
PWNED = "\e[31m𝕡𝕨𝕟𝕖𝕕\e[0m"

# Whitespace generator so display stays in same place regardless of name length

def whitespace(entity, char, size)
  char * (size - entity[:name].length)
end

# Padding Generator

def padding_generator(message, char, size)
  padding = char * [1, (size - message.length) / 2].max
  "#{padding} #{message} #{padding}"
end

# Created text break method to align messages
# Automatically calls padding generator and takes same arguments

def text_break(message, char, size)
  words = message.split
  lines = []
  current_line = []

  words.each do |word|
    if current_line.join(' ').length + word.length + 1 <= size
      current_line << word
    else
      lines << current_line.join(' ')
      current_line = [word]
    end
  end

  lines << current_line.join(' ') unless current_line.empty?
  lines.map { |line| padding_generator(line, char, size) }
end

# Main game menu

def load_menu
  t = [
    "   🥷 [t] Strike first! Strike hard! No mercy!",
    "   🥷 [t] Punch 'em in their stupid ugly face",
    "   🥷 [t] Challenge 'em to a thrashing",
    "   🥷 [t] Talk about Fight Club",
    "   🥷 [t] T is for time to die!",
    "   🥷 [t] Mash 'em up, innit",
    "   🥷 [t] Pay 'em a beating",
    "   🥷 [t] Choose violence",
    "   🥷 [t] Do 'em in",
  ]

  r = [
    "   🐬 [r] Try a sommersault!",
    "   🐬 [r] Do a Barrel Roll",
    "   🐬 [r] Do a sick flip",
  ]

  y = [
    "   💨 [y] Fuckin' leg it!",
    "   💨 [y] Cheese it!",
    "   💨 [y] 'llow it!",
    "   💨 [y] Peg it!",
    "   💨 [y] Bounce",
    "   💨 [y] Mug it",
  ]

  puts "       Whatcha ya gonna do?"
  puts t.sample
  puts r.sample
  puts y.sample
end

# Name your player

def name_player(player)
  your_name = ""

  while your_name.empty?
    title_screen
    your_name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    player[:name] = "🥷 #{your_name}"
    error_message
  end

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
  "💢 " + ("🔸" * ((entity[:attack].min - 1) / 5 % 4 + 1)) + "🔶" * (entity[:attack].min / 20) +
  " #{entity[:attack].minmax.join('-')} " +
  "🔶" * (entity[:attack].max / 20) + ("🔸" * ((entity[:attack].max - 1) / 5 % 4 + 1))
end

def block_stats(entity)
  "🛡️ " + "🔹" * (entity[:block].min % 5) + "🔷" * (entity[:block].min / 5) +
  " #{entity[:block].minmax.join('-')} " +
  "🔷" * (entity[:block].max / 5) + "🔹" * (entity[:block].max % 5)
end

def percentage(entity, key)
  accuracy = 100 - (100 / (entity[key.to_sym].max))
  crit_ch = 100 - accuracy
  key == :accuracy ? "🎯 #{accuracy}%" : " / 💥 #{crit_ch}% / "
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def enemy_bars(enemy)
  "#{health_bars(enemy)}\n" +
  "\n" +
  "    #{percentage(enemy, :accuracy)}" + "#{percentage(enemy, :crit_ch)}" + "#{attack_stats(enemy)} / " + "#{block_stats(enemy)}\n" +
  "    #{ENEMY_DIV}"
end

def weapon_bars(weapon)
  "#{BARRIER}\n" +
  "    #{weapon[:name]} / " + "#{percentage(weapon, :accuracy)}" + "#{percentage(weapon, :crit_ch)}" + attack_stats(weapon) +
  " / 🛠️ " + "🟦" * [weapon[:durability], 0].max
end

# Main UI that displays all current happenings, by chaining the above methods

def state_of_game(enemies, player, weapon, load_art)
  puts SEPARATOR
  enemies.each { |enemy| puts "    #{enemy_bars(enemy)}" }
  puts move_ascii_art(load_art)
  puts "    #{BARRIER}"
  puts "    #{health_bars(player)}\n" + "\n"
  puts "    #{block_stats(player)} / 💀 #{player[:kills]} / 🏰 #{player[:rooms]}"
  puts "    #{weapon_bars(weapon)}" if weapon[:durability].positive?
  puts SEPARATOR
end

# ERROR MESSAGES

def error_message
  messages = [
    " Don't be a pillock ‼ ",
    " Don't be a plonker ‼ ",
    " Don't be a plank ‼ ",
    " Don't be a plum ‼ ",
    " Don't be a fool ‼ ",
    " Nobody likes a joker ‼ ",
    " Quit clowning around ‼ ",
    " Quit faffing around ‼ ",
    " Quit being a melon ‼ ",
  ]

  print `clear`
  puts SEPARATOR
  puts padding_generator(messages.sample, "❌", 50)
end
