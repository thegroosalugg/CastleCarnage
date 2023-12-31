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
ICON = ICONS.sample
BARRIER     =           "#{ML}#{ICONS.sample}#{CL}" * 80
BARRIER_EN  =           "#{RD}#{ICONS.sample}#{CL}" * 80
SHIELD      = " " * 4 + "#{ML}#{ICONS.sample}#{CL}" * 72
SHIELD_EN   = " " * 4 + "#{RD}#{ICONS.sample}#{CL}" * 72
STATUS_BAR  = " " * 4 + "#{ML}#{ICON}#{CL}" * 17 + " " * 37 + "#{ML}#{ICON}#{CL}" * 18 + " " * 4

MENU_HEADER = " " * 2 + "#{ML}T̿̽̈́H͛̾͌É͌R͋̔̈́E̽͌͑ C͆̔͌A̾͋͝N̿̐͝ B̔̒͛Ë́͠ O̿͊͘N̕̕͠L͆̾̾Y̒͝ O͑͆̒N͆͋͛E͆͛̈́.͐͝͝.̓͋̈́.́̐́#{CL}"

# In game display tags

BUFFS = {
  :hp     => "#{CN}𝓖ⴑⲀꞄⲆ#{CL}",
  :block  => "#{CN}𝓖ⴑⲀꞄⲆ#{CL}",
  :attack => "#{RD}𝙍𝘼𝙂𝙀#{CL}",
  :aim    => "#{BL}🆂🅽🅸🅿🅴🆁#{CL}",
  :chance => "#{OR}ⲥꞅⲓⲧ%#{CL}",
  :crit   => "#{MG}ⲤꞅⲓⲧⲬ#{CL}"
}

ATTACKS = {
  :gambler    => "#{GN}🄶🄰🄼🄱🄻🄴🅁#{CL}",
  :somersault => "#{YL}Sᴏᴍᴇʀsᴀᴜʟᴛ#{CL}",
  :stylish    => "#{CN}🆂🆃🆈🅻🅸🆂🅷#{CL}",
  :psychic    => "#{MG}𝙋𝙎𝙮𝘾𝙝𝙞𝙘#{CL}",
  :sneaky     => "#{BL}S̷N̷E̷A̷K̷Y̷#{CL}"
}

SHOTS = {
  :hit  => "#{RD}⚔️ 𝙷𝙸𝚃 💢#{CL}",
  :crit => "#{OR}⚔️ 𝙲𝚁𝙸𝚃𝙸𝙲𝙰𝙻 💥#{CL}",
  :miss => "#{BL}𝙼𝙸𝚂𝚂💤#{CL}"
}

NUM       = ["[̼̟̞0̳  ]̻̟͜", "[̼̟̞1̳  ]̻̟͜", "[̼̟̞2̳  ]̻̟͜", "[̼̟̞3̳  ]̻̟͜", "[̼̟̞4̳  ]̻̟͜", "[̼̟̞5̳  ]̻̟͜", "[̼̟̞6̳  ]̻̟͜", "[̼̟̞7̳  ]̻̟͜", "[̼̟̞8̳  ]̻̟͜", "[̼̟̞9̳  ]̻̟͜"]

WRONG     = "#{RD}𝖂𝕽𝕺𝕹𝕲💯#{CL}"
COMBAT    = "#{RD}⚔️𝕂𝕆𝕄𝔹𝔸𝕋💀#{CL}"
BONUS     = "#{YL}🪅 ℬ𝒪𝒩𝒰𝒮 🎊#{CL}"
XP        = "#{GN}𝘹𝘱#{CL}"
LVL       = "#{RD}ˡᵛˡ#{CL}"
ITEM      = "#{GN}📦𝕀𝕋𝔼𝕄#{CL}"
THIEF     = "#{RD}👤 🆃🅷🅸🅴🅵#{CL}"
WEAPON    = "#{OR}🔪𝓦𝓔𝓐𝓟𝓞𝓝#{CL}"
BROKE     = "#{RD}𝐁𝐑𝐎𝐊𝐄💔#{CL}"
POW       = "#{OR}👊🏼ℙ𝕆𝕎💥#{CL}"
KABLAMO   = "#{RD}𝐾𝐴𝐵𝐿𝐴𝑀𝑂!💥#{CL}"
TELEPORT  = "#{YL}✨ 𝘵𝘦𝘭𝘦𝘱𝘰𝘳𝘵𝘴#{CL}"
COUNTER   = "#{BL}👊🏼ℂ𝕆𝕌ℕ𝕋𝔼ℝ#{CL}"
SUCCESS   = "#{GN}🎈 𝓢𝓤𝓒𝓒𝓔𝓢𝓢 🎉#{CL}"
FLUNKED   = "#{RD}🦨 ƑԼ𝓤ƝⲔƐƊ 🏳️#{CL}"
NO_DICE   = "#{BL}⭕ 𝖭𝖮 𝖣𝖨𝖢𝖤 🎲#{CL}"
SUMMON    = "#{MG}𝓢𝓟𝓐𝓦𝓝🪦#{CL}"
SURPRISE  = "#{YL}⚡𝘚𝘜𝘙𝘗𝘙𝘐𝘚𝘌#{CL}"
PWNED     = "#{RD}☠️𝕡𝕨𝕟𝕖𝕕#{CL}"
CARD      = "#{OR}ⲤⲀꞄⲆ#{CL}"
BLACKJACK = "#{OR}🎌 乃㇄闩⼕长丿闩⼕长 🎌#{CL}"
REVEAL    = "#{BL}DͩEͤAͣLEͤRͬ👁️‍🗨️RͬEͤVͮEͤAͣL#{CL}"
TARGET    = "#{RD}🎯 ㇄龱⼕长 龱𝓝#{CL}"
HANGOVER  = "#{OR}ℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ#{CL}"
CASH      = "#{GN}🄲🄰🅂🄷#{CL}"
DRAINED   = "#{RD}𝕯𝖗𝖆𝖎𝖓𝖊𝖉#{CL}"
SHOP      = "#{GN}𝕋𝕙𝕖 𝕊𝕙𝕠𝕡#{CL}"
GANKED    = "#{BL}ＧＡＮＫＥＤ#{CL}"
WASTED    = "#{OR}𝕎𝔸𝕊𝕋𝔼𝔻#{CL}"
LEVEL     = "#{BL}LEͤVͮEͤL UͧРⷬ#{CL}"
NAME      = "#{YL}ⲚⲀⲘⲈ ⲨⲞ𐌵ꞅϨⲈ𝓛𝓕 𝓕ⲞⲞ𝓛#{CL}"
