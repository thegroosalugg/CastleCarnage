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

  puts "         \e[35m Whatcha ya gonna do? \e[0m"
  puts "     🥷 \e[31m[̼̟̞T͍̦͔]̻̟͜\e[0m \e[31m#{t.sample}\e[0m"
  puts "     🐬 \e[38;5;208m[͌̈́͘R͌̈́͆]͋͑͠\e[0m \e[38;5;208m#{r.sample}\e[0m"
  puts "     💨 \e[33m[̻͓͜Y͖͖̘]̫̼͚\e[0m \e[33m#{y.sample}\e[0m"
end

# Boss Menu

def boss_menu(player, boss_style)
  t = 4 - player[:turns] # this counts how many turns remaining and adjusts message on final turn
  n = t == 1 ? "ɴᴇxᴛ" : "ɪɴ #{t}"
  s = t == 1 ? "" : "s"
  magic = "   🔥#{player[:emoji]} \e[35m[̝̻͕Y͔̻̦]͔̞\e[0m 🪦 \e[35mⲚⲉⲥꞅⲟⲙⲁⲛⲥⲩ\e[0m  🪄"
  wait = "⏱️ \e[35mAᴠᴀɪʟᴀʙʟᴇ #{n} ᴛᴜʀɴ#{s}\e[0m"

  puts BARRIER
  puts "     \e[34mDᴇᴄɪsɪᴏɴs,\e[0m \e[36mᴅᴇᴄɪsɪᴏɴs...\e[0m"
  puts "     ⚔️ \e[34m[̿̓͐T͆͑͘]̒͠\e[0m 💀 \e[34m𝓕ⲁⲥⲉ ⲧⲏⲉ​#{boss_style}\e[0m 🌘"
  puts "   🔥#{player[:emoji]} \e[31m[͋͊͒Ŕ́͝]͆̿\e[0m 🩸 \e[31mⲂ𝓛ⲟⲟⲆ Ⲙⲁ𝓖ⲓⲕ\e[0m 🪄"
  puts player[:turns] == 4 ? magic : padding_generator(wait, "-", 50)
end
