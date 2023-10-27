# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Game Over

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

    ╭╮╱╭┳╮╱╭━━━━┳━━┳━╮╭━┳━━━┳━━━━┳━━━╮  ╭╮╱╱╭┳━━┳━━━┳━━━━┳━━━┳━━━┳╮╱╱╭╮
    ┃┃╱┃┃┃╱┃╭╮╭╮┣┫┣┫┃╰╯┃┃╭━╮┃╭╮╭╮┃╭━━╯  ┃╰╮╭╯┣┫┣┫╭━╮┃╭╮╭╮┃╭━╮┃╭━╮┃╰╮╭╯┃
    ┃┃╱┃┃┃╱╰╯┃┃╰╯┃┃┃╭╮╭╮┃┃╱┃┣╯┃┃╰┫╰━━╮  ╰╮┃┃╭╯┃┃┃┃╱╰┻╯┃┃╰┫┃╱┃┃╰━╯┣╮╰╯╭╯
    ┃┃╱┃┃┃╱╭╮┃┃╱╱┃┃┃┃┃┃┃┃╰━╯┃╱┃┃╱┃╭━━╯  ╱┃╰╯┃╱┃┃┃┃╱╭╮╱┃┃╱┃┃╱┃┃╭╮╭╯╰╮╭╯
    ┃╰━╯┃╰━╯┃┃┃╱╭┫┣┫┃┃┃┃┃╭━╮┃╱┃┃╱┃╰━━╮  ╱╰╮╭╯╭┫┣┫╰━╯┃╱┃┃╱┃╰━╯┃┃┃╰╮╱┃┃
    ╰━━━┻━━━╯╰╯╱╰━━┻╯╰╯╰┻╯╱╰╯╱╰╯╱╰━━━╯  ╱╱╰╯╱╰━━┻━━━╯╱╰╯╱╰━━━┻╯╰━╯╱╰╯
  ASCII
end

def play_again
  puts <<-'ASCII'

     ╭╮╱╱╭╮╱╱╭━━━┳━━━┳━━━┳╮╱╱╭━━━┳╮╱╱╭╮           ╭━╮╱╭╮╱╱╭━╮╱╭╮╱╱╭╮
     ┃╰╮╭╯┃╱╱┃╭━╮┃╭━━┫╭━╮┃┃╱╱┃╭━╮┃╰╮╭╯┃           ┃┃╰╮┃┃╱╱┃┃╰╮┃┃╱╱┃┃
     ╰╮╰╯╭╯╭╮┃╰━╯┃╰━━┫╰━╯┃┃╱╱┃┃╱┃┣╮╰╯╭╯           ┃╭╮╰╯┃╭╮┃╭╮╰╯┣━━┫╰━╮
     ╱╰╮╭╯╱╰╯┃╭╮╭┫╭━━┫╭━━┫┃╱╭┫╰━╯┃╰╮╭╯            ┃┃╰╮┃┃╰╯┃┃╰╮┃┃╭╮┃╭╮┃
     ╱╱┃┃╱╱╭╮┃┃┃╰┫╰━━┫┃╱╱┃╰━╯┃╭━╮┃╱┃┃             ┃┃╱┃┃┃╭╮┃┃╱┃┃┃╭╮┃┃┃┃
     ╱╱╰╯╱╱╰╯╰╯╰━┻━━━┻╯╱╱╰━━━┻╯╱╰╯╱╰╯             ╰╯╱╰━╯╰╯╰╯╱╰━┻╯╰┻╯╰╯
  ASCII
end

CASTLE_CARNAGE =
  <<-'ASCII'
          ╭━━━┳━━━┳━━━┳━━━━┳╮╱╱╭━━━╮ ╭━━━┳━━━┳━━━┳━╮╱╭┳━━━┳━━━┳━━━╮
          ┃╭━╮┃╭━╮┃╭━╮┃╭╮╭╮┃┃╱╱┃╭━━╯ ┃╭━╮┃╭━╮┃╭━╮┃┃╰╮┃┃╭━╮┃╭━╮┃╭━━╯
          ┃┃╱╰┫┃╱┃┃╰━━╋╯┃┃╰┫┃╱╱┃╰━━╮ ┃┃╱╰┫┃╱┃┃╰━╯┃╭╮╰╯┃┃╱┃┃┃╱╰┫╰━━╮
          ┃┃╱╭┫╰━╯┣━━╮┃╱┃┃╱┃┃╱╭┫╭━━╯ ┃┃╱╭┫╰━╯┃╭╮╭┫┃╰╮┃┃╰━╯┃┃╭━┫╭━━╯
          ┃╰━╯┃╭━╮┃╰━╯┃╱┃┃╱┃╰━╯┃╰━━╮ ┃╰━╯┃╭━╮┃┃┃╰┫┃╱┃┃┃╭━╮┃╰┻━┃╰━━╮
          ╰━━━┻╯╱╰┻━━━╯╱╰╯╱╰━━━┻━━━╯ ╰━━━┻╯╱╰┻╯╰━┻╯╱╰━┻╯╱╰┻━━━┻━━━╯
  ASCII

CASTLE = # Title Screen
  <<-'ASCII'
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

  ASCII

# Main to Boss Transition

def continue
  puts  <<-'ASCII'
                        dS$$S$S$S$S$S$S$$Sb
                       :$$S^S$S$S$S$S$S^S$$;
          ╭━━━╮╭╮      SSP   `^$S$S$^'   TSS       ╭━━━╮╱╱╱╱╭╮╱╱╭╮╱╱╱╱╱╱╱╭╮
          ┃╭━╮┃┃┃      $$       `"'       $$       ┃╭━╮┃╱╱╱╭╯╰╮╭╯╰╮╱╱╱╱╱╭╯╰╮
          ┃┃╱┃┣┫┃     _SS ,-           -  SS_      ┃╰━━┳━━┳┻╮╭╯┣╮╭╯╭━━┳╮┣╮╭╯
          ┃┃╱┃┣╋╯    :-.|  _    - .-   _  |.-;     ╰━━╮┃╭╮┃╭┫┃╱┣┫┃╱┃╭╮┃┃┃┃┃
          ┃╰━╯┃┣╮    :\(; ' "-._.'._.-" ` |)/;     ┃╰━╯┃╰╯┃┃┃╰╮┃┃╰╮┃╰╯┃╰╯┃╰╮
          ╰━━━┻┻╯     \`|  , o       o .  |'/      ╰━━━┻━━┻╯╰━╯╰┻━╯╰━━┻━━┻━╯
                       ":     -'   `-     ;"
                         ;.              :                 ╱╱╱╱╱╱╭╮
                         : `    ._.    ' ;                 ╱╱╱╱╱╭╯╰╮
                       .sSb   ._____.   dSs.               ╭╮╭┳━┻╮╭╋━━╮
                    _.d8dSSb.   ._.   .SSbT8b._            ┃╰╯┃╭╮┃┃┃┃━┫
                _.oOPd88SSSS T.     .P SSSS888OOo.         ┃┃┃┃╭╮┃╰┫┃━┫
            _.mMMOOPd888SSSSb TSqqqSP dSSSS88OMOOOMm._     ╰┻┻┻╯╰┻━┻━━╯
        .oOMMMOMOOM8O8OSSSSSb TSSSP dSSSSS8OOMMOOMMOOOo._
      .OOMMOOOMMOOMOOOO  "^SSSTSSP dSSS^"OOOOMMOOMMMOOMMMb.
      dOOOMMMOMMOOOMOOOO      "^SSSS^"   :OOO8MMMOOMMOOMMOMMb
     :MMMOOMMOMMOOMMO8OS         `P      8O8OPdMMOOMMOMMOMMMM;
     MMMMOOMMMMMOOMbTO8S;               :8888MMMMMOMMOMMOMMMMM
     OMMMMOOMMMMOOOMMOOOS        S     :O8OPdMOMMMOMOMMOOMMMMO
    :OMMMMOOMMOMMOOMbTObTb.     :S;   .PdOPdMOOMMMMMOMMOMMMMMO;
    MOOMMMMOMMOMMOOMMMOObTSSg._.SSS._.PdOPdMOOMMMMOMMMMOMMMMOOM
    MMOMMMMOMMMOMMOOMMbT8bTSSSSSSSSSPd8OPdOOOMMMMOOMMMMOMMMOOMM
    MMOMMMOMMMMMOMMOOMMMbT8bTSSSSSPd88PdOOOOMMMMOOMMMMMMMMOOMMM
  ASCII
end
