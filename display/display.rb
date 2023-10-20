# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def game_info(enemies, player) # Main UI that displays all current happenings
  puts BARRIER_EN
  enemies.each { |enemy| display_bars(enemy) }
  puts move_ascii_art(player)
  display_bars(player)
  status(player)
  puts BARRIER
end

def display_bars(who) # generator that combines methods to create dynamic displays for enemies and player
  puts SHIELD if who[:id] == :player
  puts "#{health_bars(who)} #{percentage(who, :aim)} #{percentage(who, :chance)} #{stats(who, :attack)} #{stats(who, :block)}"
  puts "#{durability(who)}" if who[:weapon]
  puts SHIELD_EN if who[:id] == :enemy
end

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

def move_ascii_art(player) # move ASCII art
  offset = player[:land][:id] == :move ? rand(10..30) : 10 # checks if art moves on each loop or if static it centers art without hardcode
  player[:land][:art].split("\n").map { |line| " " * offset + line }.join("\n")
end                        # \n represents line break when concatenating strings

# UI Elements for Health, Attack, Block, Aim and Crit Chance for any entity
def health_bars(who) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]
  n = who[:id] == :player ? 20 : 16

  who[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.
  full  = ((who[:hp] - 1) / n + 1).clamp(0, 5)
  empty = (5 - full)
  life  = "#{who[:emoji]}" * full + "🤍" * empty

  " " * 4 + "#{who[:name]}" + "#{whitespace(who, " ", 11)}" + "#{who[:emoji]}#{who[:hp].to_i} #{life}"
end

def stats(who, stat) # displays for attack and block
  icon, square, div = stat == :attack ? ["💢", "🟧", 5] : ["🛡️", "🟦", 2]
  who   = who[:weapon] ? who[:weapon] : who
  full  = (who[stat] / div).clamp(0, 5)
  empty = (5 - full)
  "#{icon}" + "#{square}" * full + "⬜" * empty
end

def percentage(who, key) # aim and crit %
  who    = who[:weapon]   ?  who[:weapon] : who
  icon   = key == :chance ?          "💥" : "🎯"
  chance = (who[key.to_sym] * 10).clamp(0, 100)
  "#{icon}#{chance}%"
end

def durability(who) # weapon durability
  " "  * 4 + "#{who[:weapon][:name]}"          + " " * (62 - who[:weapon][:name].length) + "🛠️" +
  "🟩" *       who[:weapon][:uses].clamp(0, 5) +
  "⬜" * (5 - who[:weapon][:uses]).clamp(0, 5)
end

def status(player) # Dynamic status for player cash & drunkness
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

def whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total) # blackjack game info
  boss_cards, your_cards = [boss_hand, your_hand].map { |hand| hand.map { |card| card[:suit] } }
  w, x, y = [boss_hand.first[:value], boss_total, your_total].map { |n| n >= 10 ? "" : " " } # adds a single whitespace for single integer display
  # "%02d" % adds a leading zero to single digits
  puts BARRIER_EN
  puts whitespace(the_boss, " ", 30) + # whitespace generator so display is consistent regardless of name length
  "#{the_boss[:name]} #{MG}⟪#{w}#{boss_hand.first[:value]}⟫#{CL} ʃ #{boss_cards[0]}  🃏" unless player[:stuck]
  puts whitespace(the_boss, " ", 30) +
  "#{the_boss[:name]} #{MG}⟪#{x}#{boss_total}⟫#{CL} ʃ #{boss_cards.join(' ')}" if player[:stuck]
  puts whitespace(player, " ", 30) +
  "#{player[:name]} #{GN}⟪#{y}#{your_total}⟫#{CL} ʃ #{your_cards.join(' ')}"
end

def whos_the_boss(your_hand, your_total, boss_total) #blackjack victory messages
  win =       SUCCESS
  lose =      FLUNKED + " now get out❗"
  blackjack = BLACKJACK

  messages = if your_total == 21 && your_hand.length == 2 && boss_total != 21
    blackjack
  elsif your_total <= 21 && (your_total > boss_total || boss_total > 21)
    win
  else
    lose
  end
  puts text_break(messages, " ", 80)
end
