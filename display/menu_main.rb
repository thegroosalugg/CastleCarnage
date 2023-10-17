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

  puts " " * 27 + "#{ML}𝕎ℍ𝔸𝕋ℂℍ𝔸 𝔾𝕆ℕℕ𝔸 𝔻𝕆❔#{CL}"
  puts " " * 20 + "🥷 #{RD}[̼̟̞T͍̦͔]̻̟͜#{t.sample}#{CL}"
  puts " " * 20 + "🐬 #{OR}[͌̈́͘R͌̈́͆]͋͑͠#{r.sample}#{CL}"
  puts " " * 20 + "💨 #{YL}[̻͓͜Y͖͖̘]̫̼͚#{y.sample}#{CL}"
  puts BARRIER
end
