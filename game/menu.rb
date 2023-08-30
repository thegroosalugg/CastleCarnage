# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def load_menu
  t = [
    "🐱‍👤 [t]: T is for time to die fucker!",
    "🐱‍👤 [t]: Punch him in his stupid ugly face",
    "🐱‍👤 [t]: Strike first! Strike hard! No mercy!",
    "🐱‍👤 [t]: Your soul is mine!",
    "🐱‍👤 [t]: Hadouken!",
  ]

  r = [
    "🐱‍🏍  [r]: Try a sommersault!",
    "🐱‍🏍  [r]: Do a backflip",
    "🐱‍🏍  [r]: Roundhouse!",
    "🐱‍🏍  [r]: Go Super Saiyan",
    "🐱‍🏍  [r]: Parkour, parkour!",
  ]

  y = [
    " 💨   [y]: Fuckin' leg it!",
    " 💨   [y]: Pussy out",
    " 💨   [y]: Melt out",
    " 💨   [y]: Skive off",
    " 💨   [y]: Mug it",
  ]

  puts "       Whatcha ya gonna do?"
  puts t.sample
  puts r.sample
  puts y.sample
end
