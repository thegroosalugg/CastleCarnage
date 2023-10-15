# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Band => [DanceOff, KegStand] && Barkeep => BlackJack

def game_menu(method)
  puts BARRIER
  if method == :dance
    puts "    #{ML}ℬℯ 𝓅𝓇ℴ𝒻ℯ𝓈𝓈𝒾ℴ𝓃𝒶𝓁𝓁𝓎 ℊℴℴ𝒹 𝓁ℴℴ𝓀𝒾𝓃ℊ...#{CL}"
    puts "    #{CN}#{NUM[4]} 🧊 𝔹𝕝𝕦𝕖𝕊𝕥𝕖𝕖𝕝#{CL}"
    puts "    #{OR}#{NUM[5]} 🐯 Lᴇ Tɪɢʀᴇ#{CL}"
    puts "    #{MG}#{NUM[6]} 🍦 𝕄𝔸𝔾ℕ𝕌𝕄#{CL}"
  elsif method == :keg
    puts "    #{ML}Ⲥⲏⲟⲟ𝛓ⲉ ⲩⲟ𐌵ꞅ ⲣⲟⲕⲉⲙⲟⲛ#{CL}"
    puts "    #{RD}#{NUM[4]} 🦎𝕮𝖍𝖆𝖗𝖒𝖆𝖓𝖉𝖊𝖗🔥#{CL}"
    puts "    #{BL}#{NUM[5]} 🐢 𝒮𝓆𝓊𝒾𝓇𝓉𝓁ℯ 💧#{CL}"
  elsif method == :cards
    puts "    #{MG}поиграй в игру сука#{CL}"
    puts "    #{GN}#{NUM[4]} 🃏 Eщё!#{CL}"
    puts "    #{RD}#{NUM[5]} 🪂 Пиздᴇц!#{CL}"
  elsif method == :again
    puts "    #{MG}xᴏᴘᴏᴡᴀя игᴘᴀ, ᴋᴀᴋ xᴏчᴇᴡь ᴇщᴇ ᴏдʜʏ?#{CL}"
    puts "    #{GN}#{NUM[4]} 🎰 Давай!#{CL}"
    puts "    #{RD}#{NUM[5]} 💨 ᴏтʙᴀли!#{CL}"
  end
end

def show_your_moves(player, the_boss, user_moves, boss_moves, method)
  moves = {
    4 => "#{CN}🧊 𝔹𝕝𝕦𝕖𝕊𝕥𝕖𝕖𝕝#{CL}",
    5 => "#{OR}🐯 Lᴇ Tɪɢʀᴇ #{CL}",
    6 => "#{MG}🍦 𝕄𝔸𝔾ℕ𝕌𝕄   #{CL}"
  }
  pkmn = {
    4 => "#{RD}🦎𝕮𝖍𝖆𝖗𝖒𝖆𝖓𝖉𝖊𝖗🔥#{CL}",
    5 => "#{BL}🐢 𝒮𝓆𝓊𝒾𝓇𝓉𝓁ℯ 💧#{CL}"
  }

  if method == :dance
    boss_moves.each_with_index do |boss, round|
      user = user_moves[round]
      x = case
      when (user == 4 && boss == 6) then SUCCESS
      when (user == 6 && boss == 4) then FLUNKED
      when user > boss then SUCCESS
      when user < boss then FLUNKED
      else "🍃 #{MISSED}  🍂"
      end
      puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{moves[user]} #{x} #{moves[boss]} 🗨️ #{the_boss[:name]}"
    end
  elsif method == :keg
    x = user_moves == boss_moves ? "#{SUCCESS}" : "#{FLUNKED}"
    puts whitespace(player, " ", 14) + "#{player[:name]} 💬 #{pkmn[user_moves]} #{x} #{pkmn[boss_moves]} 🗨️ #{the_boss[:name]}"
  end
  puts BARRIER
end
