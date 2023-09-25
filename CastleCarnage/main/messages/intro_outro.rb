# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro_enemy(enemy)
  enemy_phrases = [
    "You got proper pissed 🍷 and ended up in some 🏰 castle, a #{enemy[:name]} jumped from the ceiling!
    'You goon get it now boy!'",

    "You got caught ganking 🍻 hooch from the 🏡 package store.
    The 🏇🏌️‍♀️ townsfolk set the #{enemy[:name]} on you!",

    "#{enemy[:name]} busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
  ]

  puts enemy_phrases.sample
end

def intro_weapon(weapon, enemy)
  weapon_phrases = [
    "You ✨teleport behind #{enemy[:name]} and withdraw your #{weapon[:name]}, 'Nothing personnel, kid'",
    "There's a #{weapon[:name]} on the floor, better get that. We won't get got, we gone get!",

    "You pull out your trusty #{weapon[:name]} from your trench coat and tip your fedora.
    'The only thing sharper than my #{weapon[:name]} is my wit m'lady'",
  ]

  puts weapon_phrases.sample
end

# ASCII Att

def lose_art
  puts <<-'ASCII'

▓██   ██▓ ▒█████   █    ██    ▓█████▄  ██▓▓█████ ▓█████▄
 ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▒██▀ ██▌▓██▒▓█   ▀ ▒██▀ ██▌
  ▒██ ██░▒██░  ██▒▓██  ▒██░   ░██   █▌▒██▒▒███   ░██   █▌
  ░ ▐██▓░▒██   ██░▓▓█  ░██░   ░▓█▄   ▌░██░▒▓█  ▄ ░██▄   ▌
  ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░▒████▓ ░██░░▒████▒░▒████▓  ██▓  ██▓  ██▓
   ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒     ▒▒▓  ▒ ░▓  ░░ ▒░ ░ ▒▒▓  ▒  ▒▓▒  ▒▓▒  ▒▓▒
 ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░     ░ ▒  ▒  ▒ ░ ░ ░  ░ ░ ▒  ▒  ░▒   ░▒   ░▒
 ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░     ░ ░  ░  ▒ ░   ░    ░ ░  ░  ░    ░    ░
 ░ ░         ░ ░     ░           ░     ░     ░  ░   ░      ░    ░    ░
 ░ ░                           ░                  ░        ░    ░    ░

  ASCII
end

def win_art
  puts <<-'ASCII'
  __  __                 __________                                ______________
  _ \/ /_________  __    ___  ____/__________________ ___________________  /__  /
  __  /_  __ \  / / /    __  __/  __  ___/  ___/  __ `/__  __ \  _ \  __  /__  /
  _  / / /_/ / /_/ /     _  /___  _(__  )/ /__ / /_/ /__  /_/ /  __/ /_/ /  /_/
  /_/  \____/\__,_/      /_____/  /____/ \___/ \__,_/ _  .___/\___/\__,_/  (_)
                                                      /_/
  ASCII
end

# END OF GAME MESSAGES

def win_message(enemy)
  win_messages = [
    "You blasted #{enemy[:name]} to another dimension. Your power level has increased.",
    "#{enemy[:name]} had a sudden heart attack, you win by default.",
    "You splatted the #{enemy[:name]} like a bug.",
  ]

  puts win_messages.sample
  puts SEPARATOR
  win_art
end

def lose_message(enemy)
  lose_messages = [
    "You stacked it and fell on a spike. #{enemy[:name]} laughs at your misfortune.",
    "#{enemy[:name]} ripped your head off. You won't be coming home for dinner.",
    "You Died! #{enemy[:name]} shall feast on your entrails.",
  ]

  puts lose_messages.sample
  puts SEPARATOR
  lose_art
end
