# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def name_player(player) # Name your player
  name = ""

  while name.empty?
    title_screen
    name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    x = name.length < 5 ? "Dr. " : ""
    player[:name] = "#{GN}🥷 #{x}#{name}#{CL}"
    error(:name)
  end

  print `clear`
end

# move ASCII art

def move_ascii_art(player) # added condition, if art is boss, it moves on each loop, if static, it centers art without hardcode
  vertical_offset = player[:land][:id] == :move ? rand(10..30) : 10
  player[:land][:art].split("\n").map { |line| " " * vertical_offset + line }.join("\n")
end

# UI Elements for Health, Attack, Block, Accuracy and Crit Chance for any entity
# \n represents line break when concatenating strings

def health_bars(who) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]
  n = who[:id] == :player ? 20 : 16

  who[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.
  full = ((who[:hp] - 1) / n + 1).clamp(0, 5)
  empty = (5 - full)
  life = "#{who[:emoji]}" * full + "🤍" * empty

  " " * 4 + "#{who[:name]}" + "#{whitespace(who, " ", 11)}" + "#{who[:emoji]}#{who[:hp].to_i} #{life}"
end

def stats(who, stat)
  icon, square, div = stat == :attack ? ["💢", "🟧", 5] : ["🛡️", "🟦", 2]
  full = (who[stat] / div).clamp(0, 5)
  empty = (5 - full)
  "#{icon}" + "#{square}" * full + "⬜" * empty
end

def percentage(who, key) # determins accuracy and crit chance %
  accuracy = 100 - (100 / [1, (who[key.to_sym])].max)
  crit_ch = 100 - accuracy
  key == :accuracy ? "🎯#{"%02d" % accuracy}%" : "💥#{"%02d" % crit_ch}%"
end                       # "%02d" % adds a leading zero to single digits

def durability(who)
  " " * 4 + "#{who[:equipped]}" + " " * (62 - who[:equipped].length) + "🛠️" + "🟩" * who[:uses].clamp(0, 5) + "⬜" * (5 - who[:uses]).clamp(0, 5)
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def display_bars(who)
  puts SHIELD if who[:id] == :player
  puts "#{health_bars(who)} #{percentage(who, :accuracy)} #{percentage(who, :crit_ch)} #{stats(who, :attack)} #{stats(who, :block)}"
  puts "#{durability(who)}" if who[:equipped]
  puts SHIELD_EN if who[:id] == :enemy
end

# Dynamic status for player cash & drunkness

def status(player)
  wallet = case player[:cash]
    when 0 then "    Skint AF 🤒"
    when 1 then "Pocket Money 🤔"
    when 2 then " Weekend Job 😐"
    when 3 then "      Sorted 🫠"
    when 4 then " Filthy Rich 🤑"
    when 5 then "      Minted 😈"
    end

  drunk = case player[:drunk]
    when 0 then "     𝔸𝕓𝕤𝕥𝕚𝕟𝕖𝕟𝕥 ⚖️"
    when 1 then "   𝔾𝕠𝕥𝔸𝔹𝕦𝕫𝕫𝕆𝕟  😉"
    when 2 then "  𝔽𝕖𝕖𝕝𝕚𝕟𝕘𝕋𝕚𝕡𝕤𝕪 😏"
    when 3 then "  𝙊𝙪𝙩𝙊𝙣𝙏𝙝𝙚𝙍𝙖𝙯𝙯 🥴"
    when 4 then "  ℙ𝕣𝕠𝕡𝕖𝕣ℙ𝕚𝕤𝕤𝕖𝕕 🤤"
    when 5 then " 𝙁𝙪𝙘𝙠𝙞𝙣𝙜𝙒𝙖𝙨𝙩𝙚𝙙 😵"
    end

  left = " " * 3 + "#{GN}#{wallet} #{CL}#{"💵" * [player[:cash], 0].max}" + "💷" * [0, (5 - player[:cash])].max + " " * 4 +
  "💀#{"%02d" % player[:kills]}  🏰#{"%02d" % player[:rooms]}"
  puts SHIELD
  puts "#{left}#{OR}#{drunk}#{CL} #{"🍺" * [player[:drunk], 0].max}"
end
