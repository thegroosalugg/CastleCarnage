# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def loop_menu(enemies, player, target, menu)
  whos_holding_what(target, player) if [:play, :replay].include?(menu)
  game_info(enemies, player)
  load_menu(player, menu)
end

def load_menu(player, menu)
  if menu == :main
    puts " " * 30 + "#{ML}𝕎ℍ𝔸𝕋ℂℍ𝔸 𝔾𝕆ℕℕ𝔸 𝔻𝕆❔#{CL}"
    puts " " * 23 + "🥷 #{RD}[̼̟̞T͍̦͔]̻̟͜S͛ᴛⷮRͬIͥᴋⷦEͤ#{CL}"
    if player[:weapon] && !player[:weapon][:bonus].empty?
      if player[:drain]
        puts " " * 23 + "⭕ #{RD}[͌̈́͘R͌̈́͆]͋͑͠#{DRAINED}#{CL}"
      else
        puts " " * 23 + "🐬 #{YL}[͌̈́͘R͌̈́͆]͋͑͠#{ATTACKS[player[:weapon][:bonus]]}#{CL}"
      end
    end
    puts " " * 23 + "💨 #{OR}[̻͓͜Y͖͖̘]̫̼͚Rͬoͦoͦmͫs͛#{CL}"
    puts " " * 23 + "🛒 #{GN}[͎̼͔E͔̟͎]̻̘ #{SHOP}#{CL}" if player[:shop]
    puts " " * 23 + "🎯 #{MG}[̳5̳  6̳]̳  ᑕჄᑕしᕮ Ꮆ〇〇Ɲ⟆#{CL}"
  elsif menu == :style
    puts " " * 28 + "#{ML}𝓅𝓇ℴ𝒻ℯ𝓈𝓈𝒾ℴ𝓃𝒶𝓁𝓁𝓎 ℊℴℴ𝒹 𝓁ℴℴ𝓀𝒾𝓃ℊ...#{CL}"
    puts " " * 26 + "#{CN}#{NUM[5]} 🧊 𝔹𝕝𝕦𝕖𝕊𝕥𝕖𝕖𝕝#{CL}"
    puts " " * 26 + "#{OR}#{NUM[6]} 🐯 Lᴇ Tɪɢʀᴇ#{CL}"
    puts " " * 26 + "#{MG}#{NUM[7]} 🍦 𝕄𝔸𝔾ℕ𝕌𝕄#{CL}"
  elsif menu == :flip
    puts " " * 36 + "#{ML}F̅i̅n̅d̅ '̅e̅m̅#{CL}"
    puts " " * 22 + "#{RD}#{NUM[5]} #{player[:sight][0][:name]}#{CL}"
    puts " " * 22 + "#{BL}#{NUM[6]} #{player[:sight][1][:name]}#{CL}"
  elsif menu == :play
    puts " " * 28 + "#{ML}поиграй в игру сука#{CL}"
    puts " " * 26 + "#{GN}#{NUM[5]} 🃏 Давай!#{CL}"
    puts " " * 26 + "#{RD}#{NUM[6]} 🪂 Пиздᴇц!#{CL}"
  elsif menu == :replay
    puts " " * 24 + "#{ML}xᴏᴘᴏᴡᴀя игᴘᴀ, ᴋᴀᴋ xᴏчᴇᴡь ᴇщᴇ ᴏдʜʏ?#{CL}"
    puts " " * 26 + "#{GN}#{NUM[5]} 🎰 Eщё!#{CL}"
    puts " " * 26 + "#{RD}#{NUM[6]} 💨 ᴏтʙᴀли!#{CL}"
  end
  puts BARRIER
end

def show_your_moves(player, target, menu)
  style = {
    5 => "#{CN} 𝔹𝕝𝕦𝕖🧊𝕊𝕥𝕖𝕖𝕝#{CL}",
    6 => "#{OR}  Lᴇ🐯Tɪɢʀᴇ #{CL}",
    7 => "#{MG}   𝕄𝔸𝔾ℕ𝕌𝕄🍦 #{CL}"
  }
  if player[:sight]
    flip = {
      5 => "#{RD}#{player[:sight][0][:name]}#{CL}",
      6 => "#{BL}#{player[:sight][1][:name]}#{CL}"
    }
  end

  if menu == :style
    target[:moves].each_with_index do |them, round|
      you = player[:moves][round]
      x = case
      when (you == 5 && them == 7) then SUCCESS
      when (you == 7 && them == 5) then FLUNKED
      when you > them then SUCCESS
      when you < them then FLUNKED
      else "🍃 #{MISS}  🍂" # reusing this tag but need to pad it out with emojis
      end
      puts whitespace(player, " ", 14) + "#{player[:name]} 💬 #{style[you]} #{x} #{style[them]} 🗨️ #{target[:name]}"
    end
  elsif menu == :flip
    puts  padding_generator(player[:choice] == target[:move] ? "#{SUCCESS}" : "#{FLUNKED}", " ", 80)
    puts  " " * 14 + whitespace(player, " ", 10) + "#{player[:name]} 💬 " + "#{flip[player[:choice]]}"
    puts  " " * 14 + whitespace(target, " ", 10) + "#{target[:name]} 💬 " + "#{flip[target[:move]]}"
  end
  puts BARRIER_EN
end
