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

BARRIER    =          "#{ML}#{ICONS.sample}#{CL}" * 80
BARRIER_EN =          "#{RD}#{ICONS.sample}#{CL}" * 80
SHIELD     = " " *4 + "#{ML}#{ICONS.sample}#{CL}" * 72
SHIELD_EN  = " " *4 + "#{RD}#{ICONS.sample}#{CL}" * 72

MENU_HEADER = " " * 2 + "#{ML}T̿̽̈́H͛̾͌É͌R͋̔̈́E̽͌͑ C͆̔͌A̾͋͝N̿̐͝ B̔̒͛Ë́͠ O̿͊͘N̕̕͠L͆̾̾Y̒͝ O͑͆̒N͆͋͛E͆͛̈́.͐͝͝.̓͋̈́.́̐́#{CL}"

# In game display tags

BOSSES = {
  :barkeep => "🍻 #{OR}𝔅𝔞𝔯𝔎𝔢𝔢𝔭#{CL}",
  :bouncer => "🕶️ #{BL}Ⲃⲟ𐌵ⲛⲥⲉꞅ#{CL}",
  :band    => "🎶 #{MG}𝓉𝒽ℯ ℬ𝒶𝓃𝒹#{CL}",
  :village => "👑 #{OR}Village King#{CL}"
}

BUFFS = {
  :attack   => { plus: "#{OR}𝙍𝘼𝙂𝙀#{CL}", minus: "#{RD}ᙡ∈Ꭿⲕ∈ᖇⲙᎯﬡ#{CL}" },
  :block    => { plus: "#{BL}𝓖ⴑⲀꞄⲆ#{CL}", minus: "#{RD}𝕄𝕖𝕒𝕥𝕊𝕙𝕚𝕖𝕝𝕕#{CL}" },
  :crit_ch  => { plus: "#{BL}ⲥꞅⲓⲧ %#{CL}",  minus: "#{RD}#{CL}" },
  :accuracy => { plus: "#{YL}#{CL}", minus: "#{RD}𝓛ⲁⲙⲉ𝛓ⲏⲟⲧ#{CL}" },
}


NUM       = ["[̳0̳]̳", "[̳1̳]̳", "[̳2̳]̳", "[̳3̳]̳", "[̳4̳]̳", "[̳5̳]̳", "[̳6̳]̳", "[̳7̳]̳", "[̳8̳]̳", "[̳9̳]̳"]

WRONG     = "#{RD}𝖂𝕽𝕺𝕹𝕲💯#{CL}"
HANGOVER  = "#{OR}ℍ𝔸ℕ𝔾𝕆𝕍𝔼ℝ#{CL}"
BONUS     = "#{YL}🪅 ℬ𝒪𝒩𝒰𝒮 🎊#{CL}"
BUFF      = "#{CN}𝓑𝓤𝓕𝓕🪶#{CL}"
CASH      = "#{GN}💲🄲🄰🅂🄷#{CL}"
ITEM      = "#{GN}📦𝕀𝕋𝔼𝕄#{CL}"
DEBT      = "#{RD}ᗪ㠪乃ㄒ#{CL}"
THIEF     = "#{RD}👤 🆃🅷🅸🅴🅵#{CL}"
TRAP      = "#{YL}ƬᖇᎯᕈ🪤#{CL}"
WEAPON    = "#{OR}🔪𝓦𝓔𝓐𝓟𝓞𝓝#{CL}"
BROKE     = "#{RD}𝐁𝐑𝐎𝐊𝐄💔#{CL}"
RAGE      = "#{OR}𝙍𝘼𝙂𝙀🐲#{CL}"
POW       = "#{OR}👊🏼ℙ𝕆𝕎💥#{CL}"
KABLAMO   = "#{RD}𝐾𝐴𝐵𝐿𝐴𝑀𝑂!💥#{CL}"
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
