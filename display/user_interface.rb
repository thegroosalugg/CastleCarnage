# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def name_player(player) # Name your player
  your_name = ""

  while your_name.empty?
    title_screen
    your_name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    player[:name] = "#{GN}🥷 #{your_name}#{CL}"
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

  " " * 4 + "#{entity[:name]}  #{entity[:hp].to_i} #{"#{entity[:emoji]}" * [(entity[:hp] - 1) / 40 + 1, 0].max}"
end

def stats(entity, stat)
  icn, sq, max, div = stat == :attack ? ["💢", "🟧", 6, 10] : ["🛡️", "🟦", 4, 5]
  full = (entity[stat].max / div).clamp(0, max)
  empty = (max - full).clamp(0, max)
  "#{icn}" + "#{sq}" * full + "⬜" * empty + " #{entity[stat].minmax.join('-')} "
end

def percentage(entity, key) # determins accuracy and crit chance %
  accuracy = 100 - (100 / (entity[key.to_sym].max))
  crit_ch = 100 - accuracy
  key == :accuracy ? "🎯#{"%02d" % accuracy}% " : "💥#{"%02d" % crit_ch}%  "
end                       # "%02d" % adds a leading zero to single digits

def rage(the_boss) # boss rage bar
  "#{RAGE}" + "🪔" * [the_boss[:rage], 0].max
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def enemy_bars(enemy)
  "#{health_bars(enemy)}  " +
  "#{percentage(enemy, :accuracy)}" + "#{percentage(enemy, :crit_ch)}" +
  "#{stats(enemy, :attack)} " + "#{stats(enemy, :block)}\n" +
  SHIELD_EN
end

def weapon_bars(weapon)
  SHIELD + "\n" +
  " " * 4 + "#{weapon[:name]} " + "#{percentage(weapon, :accuracy)}" + "#{percentage(weapon, :crit_ch)}" + stats(weapon, :attack) +
  " 🛠️" + "🟩" * weapon[:durability].clamp(0, 5) + "⬜" * (5 - weapon[:durability]).clamp(0, 5)
end

# Dynamic status for player cash & drunkness

def player_status(player)
  wallet = case player[:cash]
    when 0..2   then "    Skint AF     🫥"
    when 3..5   then "  Pocket Money   🤔"
    when 6..9   then " Got some Moolah 😐"
    when 10..13 then "     Sorted      🫠"
    when 14..17 then "  Filthy Rich    🤑"
    when 18..20 then " Totally Minted  😈"
    end

  drunk = case player[:drunk]
    when 0..2   then "Sober as a Judge ⚖️"
    when 3..5   then " Got a Buzz on   😉"
    when 6..9   then " Feeling Tipsy   😏"
    when 10..13 then " Out on the Razz 🥴"
    when 14..17 then " Proper Pissed   🤤"
    when 18..20 then " Fucking Wasted  😵"
    end

  SHIELD + "\n" +
  "    #{GN}#{wallet}#{CL} #{'💵' * [player[:cash], 0].max}\n" +
  "    #{OR}#{drunk}#{CL} #{'🍺' * [player[:drunk], 0].max}"
end
