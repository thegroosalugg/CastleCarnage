# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def name_player(player) # Name your player
  your_name = ""

  while your_name.empty?
    title_screen
    your_name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    player[:name] = "\e[32m🥷 #{your_name}\e[0m"
    error_message
  end

  print `clear`
end

# move ASCII art

def move_ascii_art(load_boss) # added condition, if art is boss, it moves on each loop, if static, it centers art without hardcode
  vertical_offset = load_boss[:id] == :move ? rand(10..30) : 10
  load_boss[:art].split("\n").map { |line| " " * vertical_offset + line }.join("\n")
end

# UI Elements for Health, Attack, Block, Accuracy and Crit Chance for any entity
# \n represents line break when concatenating strings

def health_bars(entity) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🤍", "🖤", "🤎", "💔", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]

  entity[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.

  "#{entity[:name]} / #{entity[:hp].to_i} #{entity[:emoji]} / #{"#{entity[:emoji]}" * [(entity[:hp] - 1) / 40 + 1, 0].max}"
end

def attack_stats(entity) # display for attack
  "💢 " + ("🔸" * ((entity[:attack].min - 1) / 5 % 4 + 1)) + "🔶" * (entity[:attack].min / 20) +
  " #{entity[:attack].minmax.join('-')} " +
  "🔶" * (entity[:attack].max / 20) + ("🔸" * ((entity[:attack].max - 1) / 5 % 4 + 1))
end

def block_stats(entity) # display for block
  "🛡️ " + "🔹" * (entity[:block].min % 5) + "🔷" * (entity[:block].min / 5) +
  " #{entity[:block].minmax.join('-')} " +
  "🔷" * (entity[:block].max / 5) + "🔹" * (entity[:block].max % 5)
end

def percentage(entity, key) # determins accuracy and crit chance %
  accuracy = 100 - (100 / (entity[key.to_sym].max))
  crit_ch = 100 - accuracy
  key == :accuracy ? "🎯 #{accuracy}%" : " / 💥 #{crit_ch}% / "
end

def rage(the_boss) # boss rage bar
  "#{RAGE} " + "🪔" * [the_boss[:rage], 0].max
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def enemy_bars(enemy)
  "#{health_bars(enemy)}\n" +
  "\n" +
  "    #{percentage(enemy, :accuracy)}" + "#{percentage(enemy, :crit_ch)}" + "#{attack_stats(enemy)} / " + "#{block_stats(enemy)}\n" +
  "    #{SHIELD_EN}"
end

def weapon_bars(weapon)
  "#{SHIELD_PL}\n" +
  "    #{weapon[:name]} / " + "🛠️ " + "🟦" * [weapon[:durability], 0].max + "\n" +
  "\n    #{percentage(weapon, :accuracy)}" + "#{percentage(weapon, :crit_ch)}" + attack_stats(weapon)

end

# Dynamic status for player cash & drunkness

def player_status(player)
  wallet = case player[:cash]
    when 0..2   then "    Skint AF     🫥 /"
    when 3..5   then "  Pocket Money   🤔 /"
    when 6..9   then " Got some Moolah 😐 /"
    when 10..13 then "     Sorted      🫠 /"
    when 14..17 then "  Filthy Rich    🤑 /"
    when 18..20 then " Totally Minted  😈 /"
    end

  drunk = case player[:drunk]
    when 0..2   then "Sober as a Judge ⚖️ /"
    when 3..5   then " Got a Buzz on   😉 /"
    when 6..9   then " Feeling Tipsy   😏 /"
    when 10..13 then " Out on the Razz 🥴 /"
    when 14..17 then " Proper Pissed   🤤 /"
    when 18..20 then " Fucking Wasted  😵 /"
    end

  "#{SHIELD_PL}\n" +
  "    \e[32m#{wallet}\e[0m #{'💵' * [player[:cash], 0].max}\n" +
  "    \e[38;5;208m#{drunk}\e[0m #{'🍺' * [player[:drunk], 0].max}"
end
