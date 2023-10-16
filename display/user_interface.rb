# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def name_player(player) # Name your player
  your_name = ""

  while your_name.empty?
    title_screen
    your_name = gets.chomp.strip.slice(0, 9).downcase.capitalize
    player[:name] = "#{GN}🥷 #{your_name}#{CL}"
    error(:name)
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

def health_bars(who) # random emoji assigner for every entity
  emojis = ["❤️", "🧡", "💛", "💚", "💙", "💜", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"]
  n = who[:id] == :player ? 40 : 20

  who[:emoji] ||= emojis.sample # Assigns an emoji only if the value is nil.
  full = ((who[:hp] - 1) / n + 1).clamp(0, 5)
  empty = (5 - full).clamp(0, 5)
  life = "#{who[:emoji]}" * full + "🤍" * empty

  " " * 4 + "#{who[:name]}" + "#{whitespace(who, " ", 20)}" + "#{who[:hp].to_i} #{life}"
end

def stats(who, stat)
  icn, sq, max, div = stat == :attack ? ["💢", "🟧", 5, 4] : ["🛡️", "🟦", 5, 2]
  full = (who[stat] / div).clamp(0, max)
  empty = (max - full).clamp(0, max)
  "#{icn}" + "#{sq}" * full + "⬜" * empty
end

def percentage(who, key) # determins accuracy and crit chance %
  accuracy = 100 - (100 / (who[key.to_sym]))
  crit_ch = 100 - accuracy
  key == :accuracy ? "🎯#{"%02d" % accuracy}%" : "💥#{"%02d" % crit_ch}%"
end                       # "%02d" % adds a leading zero to single digits

def rage(the_boss) # boss rage bar
  "#{RAGE}" + "🪔" * [the_boss[:rage], 0].max
end

# Display generators that combine above methods to create dynamic displays for enemy and weapon

def display_bars(who)
  puts SHIELD if who[:id] == :player
  puts "#{health_bars(who)} #{percentage(who, :accuracy)} #{percentage(who, :crit_ch)} #{stats(who, :attack)} #{stats(who, :block)}"
  puts SHIELD_EN if who[:id] == :enemy
end

def weapon_bars(weapon) # kill
  SHIELD + "\n" +
  " " * 4 + "#{weapon[:name]} " + "#{percentage(weapon, :accuracy)}" + "#{percentage(weapon, :crit_ch)}" + stats(weapon, :attack) +
  " 🛠️" + "🟩" * weapon[:durability].clamp(0, 5) + "⬜" * (5 - weapon[:durability]).clamp(0, 5)
end

# Dynamic status for player cash & drunkness

def status(player)
  wallet = case player[:cash]
    when 0 then "    Skint AF     🫥"
    when 1 then "  Pocket Money   🤔"
    when 2 then " Got some Moolah 😐"
    when 3 then "     Sorted      🫠"
    when 4 then "  Filthy Rich    🤑"
    when 5 then " Totally Minted  😈"
    end

  drunk = case player[:drunk]
    when 0 then "Sober as a Judge ⚖️"
    when 1 then " Got a Buzz on   😉"
    when 2 then " Feeling Tipsy   😏"
    when 3 then " Out on the Razz 🥴"
    when 4 then " Proper Pissed   🤤"
    when 5 then " Fucking Wasted  😵"
    end

  puts SHIELD
  puts " " * 4 + "#{GN}#{wallet}#{CL} #{'💵' * [player[:cash], 0].max}"
  puts " " * 4 + "#{OR}#{drunk}#{CL} #{'🍺' * [player[:drunk], 0].max}"
end
