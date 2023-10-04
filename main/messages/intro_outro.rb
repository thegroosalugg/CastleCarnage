# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro(player, weapon, enemy)
  enemy_intro = [
    "You got proper pissed 🍷 and ended up in some 🏰 castle, a #{enemy[:name]} jumped from the ceiling! 'You goon get it now boy!'",
    "You got caught ganking 🍻 hooch from the 🏡 package store. The 🏇🏌️‍♀️ townsfolk set the #{enemy[:name]} on you!",
    "#{enemy[:name]} busted through the 🚪 door, they're stark raving mad. They're out for 🔪 blood!",
  ]
  player_intro = [
    "You teleport ✨ behind #{enemy[:name]} and withdraw your #{weapon[:name]}. #{player[:name]}: 'Nothing personnel, kid'",
    "There's a #{weapon[:name]} on the floor, better get that. We won't get got, we gone get!",
    "You pull out your trusty #{weapon[:name]} from your trench coat and tip your fedora. #{player[:name]}: 'The only thing sharper than my #{weapon[:name]} is my wit m'lady'",
  ]

  puts text_break([enemy_intro.sample, player_intro.sample].join(' '), " ", 70)
end

# END OF GAME MESSAGES

def game_over(enemy, player)
  win = [
    "You blasted #{enemy[:name]} to another dimension. Your power level has increased.",
    "#{enemy[:name]} had a sudden heart attack, you win by default.",
    "You splatted the #{enemy[:name]} like a bug.",
  ]
  lose = [
    "You stacked it and fell on a spike. #{enemy[:name]} laughs at your misfortune.",
    "#{enemy[:name]} ripped your head off. You won't be coming home for dinner.",
    "You Died! #{enemy[:name]} shall feast on your entrails.",
  ]

  puts SEPARATOR if enemy[:id] == :boss
  puts text_break((player[:hp].positive? ? win : lose).sample, " ", 70)
  puts SEPARATOR
  player[:hp].positive? ? win_art : lose_art
  puts SEPARATOR
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

def play_again
  puts <<-'ASCII'

  █▀█ █▀█ █▀▀ █▀ █▀   █▀ █▄█ ▀█   ▀█▀ █▀█   █▀█ █░░ ▄▀█ █▄█   ▄▀█ █▀▀ ▄▀█ █ █▄░█ 
  █▀▀ █▀▄ ██▄ ▄█ ▄█   █▄ ░█░ ▄█   ░█░ █▄█   █▀▀ █▄▄ █▀█ ░█░   █▀█ █▄█ █▀█ █ █░▀█ 
  ASCII
end

def title_screen
  puts <<-'ASCII'

  ░█████╗░░█████╗░░██████╗████████╗██╗░░░░░███████╗  ░█████╗░░█████╗░██████╗░███╗░░██╗░█████╗░░██████╗░███████╗
  ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██║░░░░░██╔════╝  ██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔══██╗██╔════╝░██╔════╝
  ██║░░╚═╝███████║╚█████╗░░░░██║░░░██║░░░░░█████╗░░  ██║░░╚═╝███████║██████╔╝██╔██╗██║███████║██║░░██╗░█████╗░░
  ██║░░██╗██╔══██║░╚═══██╗░░░██║░░░██║░░░░░██╔══╝░░  ██║░░██╗██╔══██║██╔══██╗██║╚████║██╔══██║██║░░╚██╗██╔══╝░░
  ╚█████╔╝██║░░██║██████╔╝░░░██║░░░███████╗███████╗  ╚█████╔╝██║░░██║██║░░██║██║░╚███║██║░░██║╚██████╔╝███████╗
  ░╚════╝░╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚══════╝╚══════╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░╚═════╝░╚══════╝

                                                  |>>>
                                                  |
                                    |>>>      _  _|_  _         |>>>
                                    |        |;| |;| |;|        |
                                _  _|_  _    \\.    .  /    _  _|_  _
                               |;|_|;|_|;|    \\:. ,  /    |;|_|;|_|;|
                               \\..      /    ||;   . |    \\.    .  /
                                \\.  ,  /     ||:  .  |     \\:  .  /
                                 ||:   |_   _ ||_ . _ | _   _||:   |
                                 ||:  .|||_|;|_|;|_|;|_|;|_|;||:.  |
                                 ||:   ||.    .     .      . ||:  .|
                                 ||: . || .     . .   .  ,   ||:   |       \,/
                                 ||:   ||:  ,  _______   .   ||: , |            /`\
                                 ||:   || .   /+++++++\    . ||:   |
                                 ||:   ||.    |+++++++| .    ||: . |
                              __ ||: . ||: ,  |+++++++|.  . _||_   |
                     ____--`~    '--~~__|.    |+++++__|----~    ~`---,              ___
                -~--~                   ~---__|,--~'                  ~~----_____-~'   `~----~~

                ㄚㄖㄩ 闩讠𝓝丶〸 ﾁ尺ㄖ爪 闩尺ㄖㄩ𝓝ᗪ 卄🝗尺🝗... 山卄ㄖ 闩尺🝗 丫ㄖㄩ?
  ASCII
end
