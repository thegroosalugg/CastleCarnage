# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# change text color in terminal with these codes

# Red:          \e[31m Text \e[0m
# Green:        \e[32m Text \e[0m
# Yellow:       \e[33m Text \e[0m
# Blue:         \e[34m Text \e[0m
# Magenta:      \e[35m Text \e[0m
# Cyan:         \e[36m Text \e[0m
# White:        \e[37m Text \e[0m
# Orange: \e[38;5;208m Text \e[0m

RD = "\e[31m"
GN = "\e[32m"
YL = "\e[33m"
BL = "\e[34m"
MG = "\e[35m"
CN = "\e[36m"
WH = "\e[37m"
OR = "\e[38;5;208m"
ML = "\e[3#{rand(1..6)}m"
CL = "\e[0m"

# various ASCII separators

SEPARATOR = "⚔" * 80
BARRIER = "〰" * 38
ENEMY_DIV = "🗡" * 76
BOSS_DIV = " " * 4 + "▪" * 76

# In game display tags

FOUR = "\e[31m[̳4̳]̳\e[0m"
FIVE = "\e[32m[̳5̳]̳\e[0m"
SIX = "\e[34m̝̫[̳6̳]̳\e[0m"
SEVEN = "\e[38;5;208m[̳7̳]̳\e[0m"
NINE = "\e[36m̘[̳9̳]̳\e[0m"
HANGOVER = "\e[38;5;208mℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ\e[0m"
BONUS = "\e[33m🪅 ℬ𝒪𝒩𝒰𝒮 🎊\e[0m"
BUFF = "\e[36m𝓑𝓤𝓕𝓕\e[0m"
CASH = "\e[32m🄲🄰🅂🄷\e[0m"
HP_PLUS = "\e[32mＭＵＮＣＨ\e[0m"
HP_MINUS = "\e[31mᗪ㠪乃ㄒ\e[0m"
ENEMY_HP = "\e[31m🆃🅷🅸🅴🅵\e[0m"
ENEMY_TRAP = "\e[32mƬᖇᎯᕈ\e[0m"
WEAPON = "\e[38;5;208m𝓦𝓔𝓐𝓟𝓞𝓝\e[0m"
BROKE = "\e[31m𝐁𝐑𝐎𝐊𝐄\e[0m"
RAGE = "\e[38;5;208mR̷A̷G̷E̷\e[0m"
CRITICAL = "\e[38;5;208m𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻\e[0m"
MISSED = "\e[34m𝙼𝙸𝚂𝚂\e[0m"
HIT = "\e[31m𝙷𝙸𝚃\e[0m"
COUNTER = "\e[36mℂ𝕆𝕌ℕ𝕋𝔼ℝ\e[0m"
SUCCESS = "\e[32m🎈 𝓢𝓤𝓒𝓒𝓔𝓢𝓢 🎉\e[0m"
FLUNKED = "\e[31m🫵🏼ƑԼ𝓤ƝⲔƐƊ 😅\e[0m"
SUMMON = "\e[35m𝓢𝓟𝓐𝓦𝓝\e[0m"
SURPRISE = "\e[33m𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌\e[0m"
PWNED = "\e[31m𝕡𝕨𝕟𝕖𝕕\e[0m"
CARD = "\e[38;5;208mⲤⲀꞄⲆ\e[0m"
BLACKJACK = "\e[38;5;208m🎌 乃㇄闩⼕长丿闩⼕长 🎌\e[0m"
