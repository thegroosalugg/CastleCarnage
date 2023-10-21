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
ML = "\e[3#{rand(2..6)}m"
CL = "\e[0m"

# various ASCII separators

ICONS = [
  '⇍', '⇌', '⇚', '⇛', '⇜', '⇝', '⇠', '⇢', '⇤', '⇥', '⇦', '⇨', '⇰', '⇺',
  '→', '←', '⇽', '⇻', '⇏', '⇎', '⇄', '≉', '↤', '↝', '↜', '⋘', '⋙',
  ]

BARRIER    =           "#{ML}#{ICONS.sample}#{CL}" * 80
BARRIER_EN =           "#{RD}#{ICONS.sample}#{CL}" * 80
SHIELD     = " " * 4 + "#{ML}#{ICONS.sample}#{CL}" * 72
SHIELD_EN  = " " * 4 + "#{RD}#{ICONS.sample}#{CL}" * 72
STATUS_BAR = " " * 4 + "#{ML}#{ICONS.sample}#{CL}" * 17 + " " * 37 + "#{ML}#{ICONS.sample}#{CL}" * 18 + " " * 4
# STATUS_BAR = " " * 4 + "#{ML}#{ICONS.sample}#{CL}" * 27 + " " * 16 + "#{ML}#{ICONS.sample}#{CL}" * 29 + " " * 4

MENU_HEADER = " " * 2 + "#{ML}T̿̽̈́H͛̾͌É͌R͋̔̈́E̽͌͑ C͆̔͌A̾͋͝N̿̐͝ B̔̒͛Ë́͠ O̿͊͘N̕̕͠L͆̾̾Y̒͝ O͑͆̒N͆͋͛E͆͛̈́.͐͝͝.̓͋̈́.́̐́#{CL}"

# In game display tags

BUFFS = {
  :hp     => "#{CN}𝓖ⴑⲀꞄⲆ#{CL}",
  :attack => "#{RD}𝙍𝘼𝙂𝙀#{CL}",
  :aim    => "#{BL}🆂🅽🅸🅿🅴🆁#{CL}",
  :chance => "#{OR}ⲥꞅⲓⲧ%#{CL}",
  :crit   => "#{MG}ⲤꞅⲓⲧⲬ#{CL}",
}

ATTACKS = {
  :gambler    => "#{GN}🄶🄰🄼🄱🄻🄴🅁#{CL}",
  :somersault => "#{YL}Sᴏᴍᴇʀsᴀᴜʟᴛ#{CL}",
  :stylish    => "#{CN}🆂🆃🆈🅻🅸🆂🅷#{CL}",
  :psychic    => "#{MG}𝙋𝙎𝙮𝘾𝙝𝙞𝙘#{CL}",
}

NUM       = ["[̼̟̞0̳  ]̻̟͜", "[̼̟̞1̳  ]̻̟͜", "[̼̟̞2̳  ]̻̟͜", "[̼̟̞3̳  ]̻̟͜", "[̼̟̞4̳  ]̻̟͜", "[̼̟̞5̳  ]̻̟͜", "[̼̟̞6̳  ]̻̟͜", "[̼̟̞7̳  ]̻̟͜", "[̼̟̞8̳  ]̻̟͜", "[̼̟̞9̳  ]̻̟͜"]

WRONG     = "#{RD}𝖂𝕽𝕺𝕹𝕲💯#{CL}"
COMBAT    = "#{RD}𝕂𝕆𝕄𝔹𝔸𝕋💀#{CL}"
BONUS     = "#{YL}🪅 ℬ𝒪𝒩𝒰𝒮 🎊#{CL}"
ITEM      = "#{GN}📦𝕀𝕋𝔼𝕄#{CL}"
THIEF     = "#{RD}👤 🆃🅷🅸🅴🅵#{CL}"
WEAPON    = "#{OR}🔪𝓦𝓔𝓐𝓟𝓞𝓝#{CL}"
BROKE     = "#{RD}𝐁𝐑𝐎𝐊𝐄💔#{CL}"
POW       = "#{OR}👊🏼ℙ𝕆𝕎💥#{CL}"
KABLAMO   = "#{RD}𝐾𝐴𝐵𝐿𝐴𝑀𝑂!💥#{CL}"
TELEPORT  = "#{YL}✨ 𝘵𝘦𝘭𝘦𝘱𝘰𝘳𝘵𝘴#{CL}"
CRIT      = "#{OR}⚔️ 𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻 💥#{CL}"
MISS      = "#{BL}𝙼𝙸𝚂𝚂💤#{CL}"
HIT       = "#{RD}⚔️ 𝙷𝙸𝚃 💢#{CL}"
COUNTER   = "#{BL}👊🏼ℂ𝕆𝕌ℕ𝕋𝔼ℝ#{CL}"
SUCCESS   = "#{GN}🎈 𝓢𝓤𝓒𝓒𝓔𝓢𝓢 🎉#{CL}"
FLUNKED   = "#{RD}🦨 ƑԼ𝓤ƝⲔƐƊ 🏳️#{CL}"
SUMMON    = "#{MG}𝓢𝓟𝓐𝓦𝓝🪦#{CL}"
SURPRISE  = "#{YL}⚡𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌#{CL}"
PWNED     = "#{RD}☠️𝕡𝕨𝕟𝕖𝕕#{CL}"
CARD      = "#{OR}ⲤⲀꞄⲆ#{CL}"
BLACKJACK = "#{OR}🎌 乃㇄闩⼕长丿闩⼕长 🎌#{CL}"
REVEAL    = "#{BL}DͩEͤAͣLEͤRͬ👁️‍🗨️RͬEͤVͮEͤAͣLEͤDͩ#{CL}"


# Incase I need them later
# TRAP      = "#{YL}ƬᖇᎯᕈ🪤#{CL}"
# DEBT      = "#{RD}ᗪ㠪乃ㄒ#{CL}"
# BUFF      = "#{CN}𝓑𝓤𝓕𝓕🪶#{CL}"
# CASH      = "#{GN}💲🄲🄰🅂🄷#{CL}"
# HANGOVER  = "#{OR}ℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ#{CL}"
# "#{RD}ᙡ∈Ꭿⲕ∈ᖇⲙᎯﬡ#{CL}"
# "#{RD}𝕄𝕖𝕒𝕥𝕊𝕙𝕚𝕖𝕝𝕕#{CL}"
# "#{RD}🄲🄸🅅🄸🄻🄸🄰🄽#{CL}"
# "#{RD}𝓛ⲁⲙⲉ𝛓ⲏⲟⲧ#{CL}"
