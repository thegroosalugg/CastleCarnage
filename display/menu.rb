# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

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

  puts " " * 27 + "#{ML}𝕎ℍ𝔸𝕋ℂℍ𝔸 𝔾𝕆ℕℕ𝔸 𝔻𝕆❔#{CL}"
  puts " " * 20 + "🥷 #{RD}[̼̟̞T͍̦͔]̻̟͜#{t.sample}#{CL}"
  puts " " * 20 + "🐬 #{OR}[͌̈́͘R͌̈́͆]͋͑͠#{r.sample}#{CL}"
  puts " " * 20 + "💨 #{YL}[̻͓͜Y͖͖̘]̫̼͚#{y.sample}#{CL}"
  puts BARRIER
end

def game_menu(method)
  if method == :dance
    puts " " * 28 + "#{ML}ℬℯ 𝓅𝓇ℴ𝒻ℯ𝓈𝓈𝒾ℴ𝓃𝒶𝓁𝓁𝓎 ℊℴℴ𝒹 𝓁ℴℴ𝓀𝒾𝓃ℊ...#{CL}"
    puts " " * 26 + "#{CN}#{NUM[4]} 🧊 𝔹𝕝𝕦𝕖𝕊𝕥𝕖𝕖𝕝#{CL}"
    puts " " * 26 + "#{OR}#{NUM[5]} 🐯 Lᴇ Tɪɢʀᴇ#{CL}"
    puts " " * 26 + "#{MG}#{NUM[6]} 🍦 𝕄𝔸𝔾ℕ𝕌𝕄#{CL}"
  elsif method == :keg
    puts " " * 28 + "#{ML}Ⲥⲏⲟⲟ𝛓ⲉ ⲩⲟ𐌵ꞅ ⲣⲟⲕⲉⲙⲟⲛ#{CL}"
    puts " " * 26 + "#{RD}#{NUM[4]} 🦎𝕮𝖍𝖆𝖗𝖒𝖆𝖓𝖉𝖊𝖗🔥#{CL}"
    puts " " * 26 + "#{BL}#{NUM[5]} 🐢 𝒮𝓆𝓊𝒾𝓇𝓉𝓁ℯ 💧#{CL}"
  elsif method == :cards
    puts " " * 28 + "#{ML}поиграй в игру сука#{CL}"
    puts " " * 26 + "#{GN}#{NUM[4]} 🃏 Eщё!#{CL}"
    puts " " * 26 + "#{RD}#{NUM[5]} 🪂 Пиздᴇц!#{CL}"
  elsif method == :again
    puts " " * 28 + "#{ML}xᴏᴘᴏᴡᴀя игᴘᴀ, ᴋᴀᴋ xᴏчᴇᴡь ᴇщᴇ ᴏдʜʏ?#{CL}"
    puts " " * 26 + "#{GN}#{NUM[4]} 🎰 Давай!#{CL}"
    puts " " * 26 + "#{RD}#{NUM[5]} 💨 ᴏтʙᴀли!#{CL}"
  end
  puts BARRIER
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
      else "🍃 #{MISS}  🍂"
      end
      puts whitespace(player, " ", 16) + "#{player[:name]} 💬 #{moves[user]} #{x} #{moves[boss]} 🗨️ #{the_boss[:name]}"
    end
  elsif method == :keg
    x = user_moves == boss_moves ? "#{SUCCESS}" : "#{FLUNKED}"
    puts whitespace(player, " ", 14) + "#{player[:name]} 💬 #{pkmn[user_moves]} #{x} #{pkmn[boss_moves]} 🗨️ #{the_boss[:name]}"
  end
  puts BARRIER_EN
end