# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->
# Main game menu

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
  
  puts " " * 22 + "#{MG}𝕎ℍ𝔸𝕋ℂℍ𝔸 𝔾𝕆ℕℕ𝔸 𝔻𝕆❔#{CL}"
  puts " " * 16 + "🥷 #{RD}[̼̟̞T͍̦͔]̻̟͜#{t.sample}#{CL}"
  puts " " * 16 + "🐬 #{OR}[͌̈́͘R͌̈́͆]͋͑͠#{r.sample}#{CL}"
  puts " " * 16 + "💨 #{YL}[̻͓͜Y͖͖̘]̫̼͚#{y.sample}#{CL}"
end

# Boss Menu

def boss_menu(player, boss_style)
  t = 4 - player[:turns] # this counts how many turns remaining and adjusts message on final turn
  n = t == 1 ? "ɴᴇxᴛ" : "ɪɴ #{t}"
  s = t == 1 ? "" : "s"
  magic = "   🔥#{player[:emoji]} #{MG}[̝̻͕Y͔̻̦]͔̞ 🪦 Ⲛⲉⲥꞅⲟⲙⲁⲛⲥⲩ#{CL}  🪄"
  wait = "⏱️ #{MG}Aᴠᴀɪʟᴀʙʟᴇ #{n} ᴛᴜʀɴ#{s}#{CL}"

  puts BARRIER
  puts " " * 24 + "#{ML}Dᴇᴄɪsɪᴏɴs, ᴅᴇᴄɪsɪᴏɴs...#{CL}"
  puts " " * 20 + "⚔️ #{BL}[̿̓͐T͆͑͘]̒͠ 💀 𝓕ⲁⲥⲉ ⲧⲏⲉ​#{boss_style}#{CL} 🌘"
  puts " " * 18 + "🔥#{player[:emoji]} #{RD}[͋͊͒Ŕ́͝]͆̿ 🩸 Ⲃ𝓛ⲟⲟⲆ Ⲙⲁ𝓖ⲓⲕ#{CL} 🪄"
  puts " " * 15 + (player[:turns] == 4 ? magic : padding_generator(wait, "#{MG}-#{CL}", 50))
end
