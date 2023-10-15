# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->


# various ASCII separators

SEPARATOR = "⚔" * 80
BARRIER = "〰" * 38
ENEMY_DIV = "🗡" * 76
BOSS_DIV = " " * 4 + "▪" * 76

# In game display tags

FOUR = "\e[31m[̳4̳]̳\e[0m"
FIVE = "\e[32m[̳5̳]̳\e[0m"
SIX = "\e[34m̝̫[̳6̳]̳\e[0m"
SEVEN = "\e[38;5;208m[̳7̳]̳\e[0m"
NINE = "\e[36m̘[̳9̳]̳\e[0m"
HANGOVER = "\e[38;5;208mℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ\e[0m"
BONUS = "\e[33mℬ𝒪𝒩𝒰𝒮\e[0m"
BUFF = "\e[36m𝓑𝓤𝓕𝓕\e[0m"
CASH = "\e[32m🄲🄰🅂🄷\e[0m"
HP_PLUS = "\e[32mＭＵＮＣＨ\e[0m"
HP_MINUS = "\e[31mᗪ㠪乃ㄒ\e[0m"
ENEMY_HP = "\e[31m🆃🅷🅸🅴🅵\e[0m"
ENEMY_TRAP = "\e[32mƬᖇᎯᕈ\e[0m"
WEAPON = "\e[38;5;208m𝓦𝓔𝓐𝓟𝓞𝓝\e[0m"
BROKE = "\e[31m𝐁𝐑𝐎𝐊𝐄\e[0m"
RAGE = "\e[38;5;208mR̷A̷G̷E̷\e[0m"
CRITICAL = "\e[38;5;208m𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻\e[0m"
MISSED = "\e[34m𝙼𝙸𝚂𝚂\e[0m"
HIT = "\e[31m𝙷𝙸𝚃\e[0m"
COUNTER = "\e[36mℂ𝕆𝕌ℕ𝕋𝔼ℝ\e[0m"
SUCCESS = "\e[32m🎈 𝓢𝓤𝓒𝓒𝓔𝓢𝓢 🎉\e[0m"
FLUNKED = "\e[31m🫵🏼ƑԼ𝓤ƝⲔƐƊ 😅\e[0m"
SUMMON = "\e[35m𝓢𝓟𝓐𝓦𝓝\e[0m"
SURPRISE = "\e[33m𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌\e[0m"
PWNED = "\e[31m𝕡𝕨𝕟𝕖𝕕\e[0m"
CARD = "\e[38;5;208mⲤⲀꞄⲆ\e[0m"
BLACKJACK = "\e[38;5;208m乃㇄闩⼕长丿闩⼕长\e[0m"

# Whitespace generator so display stays in same place regardless of name length

def whitespace(entity, char, size)
  char * [0, size - entity[:name].gsub(/\e\[[0-9;]*m/, "").length].max
end

# Padding Generator

def padding_generator(message, char, size)
  padding = char * [1, (size - message.length) / 2].max
  "#{padding} #{message} #{padding}"
end

# Created text break method to align messages
# Automatically calls padding generator and takes same arguments
# Original method kept but disabled since it handles ASCII tags above poorly

# def text_break(message, char, size)
#   words = message.split
#   lines = []
#   current_line = []

#   words.each do |word|
#     if current_line.join(' ').length + word.length + 1 <= size
#       current_line << word
#     else
#       lines << current_line.join(' ')
#       current_line = [word]
#     end
#   end

#   lines << current_line.join(' ') unless current_line.empty?
#   lines.map { |line| padding_generator(line, char, size) }
# end

# Added CHATGPT version of text break editor. ASCII tags were impelemented late development
# The use of them didn't display correctly in the above method.

def text_break(message, char, size)
  lines = []
  current_line = ""
  current_length = 0

  message.split.each do |word|
    word_with_ansi = word.gsub(/\e\[[0-9;]*m/, "")  # Remove ANSI escape codes for length calculations
    word_length = word_with_ansi.length

    if current_length + word_length + 1 > size
      lines << padding_generator(current_line, char, size)
      current_line = ""
      current_length = 0
    end

    current_line += " " if current_length > 0
    current_line += word
    current_length += word_length
  end

  lines << padding_generator(current_line, char, size) unless current_line.empty?
  lines
end

# Main game menu

def load_menu
  t = [
    " Strike first! Strike hard! No mercy!",
    " Punch 'em in their stupid ugly face",
    " Challenge 'em to a thrashing",
    " Talk about Fight Club",
    " T is for time to die!",
    " Mash 'em up, innit",
    " Pay 'em a beating",
    " Choose violence",
    " Do 'em in",
  ]

  r = [
    " Try a sommersault!",
    " Do a Barrel Roll",
    " Do a sick flip",
  ]

  y = [
    " Fuckin' leg it!",
    " Cheese it!",
    " 'llow it!",
    " Peg it!",
    " Bounce",
    " Mug it",
  ]

  puts "         \e[35m Whatcha ya gonna do? \e[0m"
  puts "     🥷 \e[31m[̼̟̞T͍̦͔]̻̟͜\e[0m \e[31m#{t.sample}\e[0m"
  puts "     🐬 \e[38;5;208m[͌̈́͘R͌̈́͆]͋͑͠\e[0m \e[38;5;208m#{r.sample}\e[0m"
  puts "     💨 \e[33m[̻͓͜Y͖͖̘]̫̼͚\e[0m \e[33m#{y.sample}\e[0m"
end

# Name your player

def name_player(player)
  your_name = ""

  while your_name.empty?
    title_screen
    your_name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    player[:name] = "\e[32m🥷 #{your_name}\e[0m"
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
  "    #{weapon[:name]} / " + "🛠️ " + "🟦" * [weapon[:durability], 0].max + "\n" +
  "\n    #{percentage(weapon, :accuracy)}" + "#{percentage(weapon, :crit_ch)}" + attack_stats(weapon)

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
