                     The game is made just for fun.
         The purpose is to practice writing and refactoring in Ruby.

********************************** UI ******************************************<br>
🐮 You   💓100 💓💓💓💓💓 🎯70% 💥20% 💢🟧🟧⬜⬜⬜ 🛡️🟦⬜⬜⬜⬜       <br>
🪡 Laser Gun                              🛠️🟨🟨🟨🟨🟨     Sᴏᴍᴇʀsᴀᴜʟᴛ        <br>
⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨                         ⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨⇨ <br>
                                𝙋𝙤𝙘𝙠𝙚𝙩𝙈𝙤𝙣𝙚𝙮                𝔾𝕠𝕥𝔸𝔹𝕦𝕫𝕫𝕆𝕟        <br>
ˡᵛˡ 1  🟪🟪🟪🟪🟪𝘹𝘱         🤔💵💷💷💷💷             😉🍺🫙🫙🫙🫙       <br>
⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻⇻ <br>
<br>
💓100 => health for player / enemies
🎯70% => accuracy
💥20% => crit chance
ˡᵛˡ 1 => player level
🟩🟪 => player xp       one square = 10
💢🟧 => attack:         one square = 5
🛡️🟦 => block:          one square = 2
🛠️🟨 => weapon uses:    one square = 1
🤔💵 => player cash:    one square = 1
😉🍺 => toxicity level: one square = 1
<br>
******************************* MAIN MENU **************************************

🥷 [̼̟̞T͍̦͔]̻̟͜S͛ᴛⷮRͬIͥᴋⷦEͤ                  => Strike the enemy. Enemy strikes back. Surprise attack possible
🐬 [͌̈́͘R͌̈́͆]͋͑͠Sᴏᴍᴇʀsᴀᴜʟᴛ              => Special attacks appear here. Play a minigame or perform a special strike
💨 [̻͓͜Y͖͖̘]̫̼͚Rͬoͦoͦmͫs͛                   => Explore rooms to find items or weapons. Surprise attack & enemy spawns possible
🛒 [͎̼͔E͔̟͎]̻̘ 𝕋𝕙𝕖 𝕊𝕙𝕠𝕡             => Appears randomly in menu. Spend all your cash for a weapon, hp and a possible item
🎯 [̳5̳  6̳]̳  ᑕჄᑕしᕮ Ꮆ〇〇Ɲ⟆   => Press 5 or 6 to cycle which enemy is targetted for combat

****************************** Combat ******************************************
=> strike the enemy. The enemy will strike back unless you deal lethal damage
=> a surprise attack is then possible when another enemy randomly strikes
=> the player can also randomly counter the surprise attacks
=> has a small chance to lower toxicity
=> as enemy spawn slots are limited, it is best to lower the hp of all enemies then line them up for OHKOs

****************************** ROOMS *******************************************
=> explore rooms to find items or weapons
=> 33% to find weapon, item or encounter an enemy
=> 4 max enemies possible, if all slots are taken, rooms will provide a 50-50 chance to find item or weapon
=> enemies can also find items or weapons
=> enemies will surprise attack you when exploring
=> as the player explores rooms, they drink beers and get drunk
=> once the player drinks 3 beers, the amount of visible rooms begins to decrease
=> for each beer drunk, an additional enemy is added to a room increasing the player's chances of an encounter
=> toxicity will be decreased for enemy kills and can also randomly decrease through combat

**************************** SPECIAL ATTACKS ***********************************

Special attacks can be found randomly attached to weapons and will be displayed underneath your block.
A new menu optin will appear when they are available.
Only 1 special attack can be made per round, after you must perform a strike or explore a room to recharge.

Somersault => 50% success - strike or get struck 2-3 times by random enemies
Sneaky     => success lowered if player is drunk
           => surprise attacks will not happen while equipped
           => steal the item of the enemy you are attacking and use it immediately
           => if your weapon is on its final use, it will steal the enemy weapon and repace it

Stylish, Gambler & Psychic
=> win and strike, lose and get struck. Wins continue the streak, one loss ends it
=> if the weapon breaks during a streak, you can continue to play using player's base attack until your streak breaks

Gambler    => challenge the enemy to blackjack
           => dealer's cards will not be revealed if dealer does not draw, unless dealer has blackjack
           => draws count as a loss and end your streak
           => Blackjack will always win unless dealer also has blackjack
           => Blackjack awards 2 strikes
           => wins award one dollar

Psychic    => guess which room the enemy is hiding in and strike. Fail and get struck
Stylish    => like paper, scissors, rock. Pick a move and beat the enemy
           => Blue Steel > Magnum > Le Tigre > Blue Steel
