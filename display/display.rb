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

def move_ascii_art(player) # move ASCII art
  offset = player[:land][:id] == :move ? rand(10..30) : 10 # checks if art moves on each loop or if static it centers art without hardcode
  player[:land][:art].split("\n").map { |line| " " * offset + line }.join("\n")
end                        # \n represents line break when concatenating strings

# UI Elements for Health, Attack, Block, Aim and Crit Chance for any entity
def health_bars(who) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]
  n = who[:id] == :player ? 20 : 10

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
  " "  * 4 + "#{who[:weapon][:name]}"          + " " * (49 - who[:weapon][:name].length) + "🛠️" +
  "🟩" *       who[:weapon][:uses].clamp(0, 5) +
  "⬜" * (5 - who[:weapon][:uses]).clamp(0, 5) + " " * 3 + "#{ATTACKS[who[:weapon][:bonus]]}"
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

def whos_holding_what(dealer, player) # blackjack game info
  dealer[:cards] = dealer[:hand].map { |card| card[:suit] }
  player[:cards] = player[:hand].map { |card| card[:suit] }

  puts BARRIER_EN
  puts                    " " * 21 + REVEAL                                                              if player[:stuck]
  puts whitespace(dealer, " ", 30) + # whitespace generator so display is consistent regardless of name length
  "#{dealer[:name]}  🃏#{YL}#{"%02d" % dealer[:hand].first[:value]}#{CL}  #{dealer[:cards][0]}  🃏" unless player[:stuck]
  puts whitespace(dealer, " ", 30) +
  "#{dealer[:name]}  🃏#{YL}#{"%02d" % dealer[:score]}#{CL}  #{dealer[:cards].join(' ')}"                if player[:stuck]
  puts whitespace(player, " ", 30) +
  "#{player[:name]}  🃏#{GN}#{"%02d" % player[:score]}#{CL}  #{player[:cards].join(' ')}"
end                         # "%02d" % adds a leading zero to single digits

def whos_the_winner(dealer, player) # blackjack shouts => require too many conditions to combine with shout method
  taunt = " 💬 " + GAME_TAUNT.sample
  messages = if player[:score] == 21 && player[:hand].length == 2 && dealer[:score] != 21
    BLACKJACK + " " + player[:name] + taunt
  elsif player[:score] <= 21 && (player[:score] > dealer[:score] || dealer[:score] > 21)
    SUCCESS   + " " + player[:name] + taunt
  else
    FLUNKED   + " " + dealer[:name] + taunt
  end
  puts text_break(messages, " ", 80)
end
