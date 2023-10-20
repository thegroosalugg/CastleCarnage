# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def name_player(player) # Name your player
  name = ""

  while name.empty?
    title_screen
    name = gets.chomp.strip.slice(0, 8).downcase.capitalize
    x = name.length < 4 ? TITLES.sample : ""
    player[:name] = "#{GN}#{EMOJIS.sample} #{x}#{name}#{CL}"
    shout(player, :name)
  end

  print `clear`
end

# move ASCII art

def move_ascii_art(player) # added condition, if art is boss, it moves on each loop, if static, it centers art without hardcode
  offset = player[:land][:id] == :move ? rand(10..30) : 10
  player[:land][:art].split("\n").map { |line| " " * offset + line }.join("\n")
end

# UI Elements for Health, Attack, Block, aim and Crit Chance for any entity
# \n represents line break when concatenating strings

def health_bars(who) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]
  n = who[:id] == :player ? 20 : 16

  who[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.
  full  = ((who[:hp] - 1) / n + 1).clamp(0, 5)
  empty = (5 - full)
  life  = "#{who[:emoji]}" * full + "🤍" * empty

  " " * 4 + "#{who[:name]}" + "#{whitespace(who, " ", 11)}" + "#{who[:emoji]}#{who[:hp].to_i} #{life}"
end

def stats(who, stat)
  icon, square, div = stat == :attack ? ["💢", "🟧", 5] : ["🛡️", "🟦", 2]
  who   = who[:weapon] ? who[:weapon] : who
  full  = (who[stat] / div).clamp(0, 5)
  empty = (5 - full)
  "#{icon}" + "#{square}" * full + "⬜" * empty
end

# def percentage(who, key) # determins aim and crit chance %
#   aim = 100 - (100 / [1, (who[key.to_sym])].max)
#   chance  = 100 - aim
#   key == :aim ? "🎯#{"%02d" % aim}%" : "💥#{"%02d" % chance}%"
# end                       # "%02d" % adds a leading zero to single digits

def percentage(who, key)
  who = who[:weapon] ? who[:weapon] : who
  chance = (who[key.to_sym] * 10).clamp(0, 100)
  icon = key == :chance ? "💥" : "🎯"
  "#{icon}#{chance}%"
end

def durability(who)
    " " * 4 + "#{who[:weapon][:name]}" + " " * (62 - who[:weapon][:name].length) +
  "🛠️" + "🟩" * who[:weapon][:uses].clamp(0, 5) +
        + "⬜" * (5 - who[:weapon][:uses]).clamp(0, 5)
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def display_bars(who)
  puts SHIELD if who[:id] == :player
  puts "#{health_bars(who)} #{percentage(who, :aim)} #{percentage(who, :chance)} #{stats(who, :attack)} #{stats(who, :block)}"
  puts "#{durability(who)}" if who[:weapon]
  puts SHIELD_EN if who[:id] == :enemy
end

# Dynamic status for player cash & drunkness

def status(player)
  wallet = case player[:cash]
    when 0 then "    𝙎𝙠𝙞𝙣𝙩 𝘼𝙁 🤒"
    when 1 then " 𝙋𝙤𝙘𝙠𝙚𝙩𝙈𝙤𝙣𝙚𝙮 🤔"
    when 2 then "  𝙒𝙚𝙚𝙠𝙚𝙣𝙙𝙅𝙤𝙗 😐"
    when 3 then "      𝙎𝙤𝙧𝙩𝙚𝙙 🫠"
    when 4 then "  𝔽𝕚𝕝𝕥𝕙𝕪ℝ𝕚𝕔𝕙 🤑"
    when 5 then "      𝑀𝑖𝑛𝑡𝑒𝑑 😈"
    end

  drunk = case player[:drunk]
    when 0 then "     𝔸𝕓𝕤𝕥𝕚𝕟𝕖𝕟𝕥 ⚖️"
    when 1 then "   𝔾𝕠𝕥𝔸𝔹𝕦𝕫𝕫𝕆𝕟  😉"
    when 2 then "  𝔽𝕖𝕖𝕝𝕚𝕟𝕘𝕋𝕚𝕡𝕤𝕪 😏"
    when 3 then "  𝙊𝙪𝙩𝙊𝙣𝙏𝙝𝙚𝙍𝙖𝙯𝙯 🥴"
    when 4 then "  ℙ𝕣𝕠𝕡𝕖𝕣ℙ𝕚𝕤𝕤𝕖𝕕 🤤"
    when 5 then " 𝙁𝙪𝙘𝙠𝙞𝙣𝙜𝙒𝙖𝙨𝙩𝙚𝙙 😵"
    end

  s1 = player[:kills] < 10 ? " " : "" # creating leading whitespace instead of leading zero
  s2 = player[:rooms] < 10 ? " " : ""

  left = " " * 3 + "#{GN}#{wallet} #{CL}#{"💵" * [player[:cash], 0].max}" + "💷" * [0, (5 - player[:cash])].max + " " * 4 +
  "💀#{s1}#{player[:kills]}  🏰#{s2}#{player[:rooms]}"
  puts STATUS_BAR
  puts "#{left}#{OR}#{drunk}#{CL} #{"🍺" * [player[:drunk], 0].max}"
end
