# Game Readme

## Introduction
The game is made just for fun. The purpose is to practice writing and refactoring in Ruby.

## User Interface
- 🐮 You
  - 💓 Health
  - 🎯 Accuracy
  - 💥 Crit Chance
  - 💢 Attack     $~$    🟧🟧⬜⬜⬜     $~~~$ (one square = 5)
  - 🛡️ Block      $~~~$   🟦⬜⬜⬜⬜    $~~$ (one square = 2)
  - ˡᵛˡ $~$ Level $~~~~$  🟩🟩🟩🟪🟪    $~~$  (one square = 10)
  - 😐 Cash       $~~~~$  💵💵💷💷💷
  - 😉 Beers      $~~~$  🍺🫙🫙🫙🫙
- 🪡 Laser Gun
  - 🛠️ Uses:     $~~~$   🟨🟨🟨🟨🟨
  - Specials:    $~~~~$   Sᴏᴍᴇʀsᴀᴜʟᴛ

## Main Menu
- 🥷 [T] STRIKE:        $~~~~~~~~~~~~~~~~~~~$ Strike the enemy. Enemy strikes back. Surprise attack possible.
- 🐬 [R] SPECIAL:       $~~~~~~~~~~~~~~~~$    Special attacks appear here. Play a minigame or perform a special strike.
- 💨 [Y] ROOMS:         $~~~~~~~~~~~~~~~~~$   Explore rooms to find items or weapons. Surprise attacks & enemy spawns possible.
- 🛒 [E] THE SHOP:      $~~~~~~~~~~~~~$       Appears randomly in the menu. Spend all your cash for a weapon, HP, and a possible item.
- 🎯 [5 6] CYCLE GOONS: $~~$                  Press 5 or 6 to cycle which enemy is targeted for combat.

## Combat
- Strike the enemy. The enemy will strike back unless you deal lethal damage.
- A surprise attack is then possible when another enemy randomly strikes.
- The player can also randomly counter the surprise attacks.
- There's a small chance to lower toxicity.
- As enemy spawn slots are limited, it's best to lower the HP of all enemies, then line them up for OHKOs.
- Items are used automatically in combat. Items will gaim a small amount of HP and affect all other stats randomly, buffed or nerfed
- When an enemy is killed, the player gains 10 hp, 10xp, 1 dollar and detoxifies 1 beer

## Rooms
- Explore rooms to find items or weapons.
- There's a 33% chance to find a weapon, item, or encounter an enemy.
- Up to 4 enemies are possible. If all slots are taken, rooms will provide a 50-50 chance to find an item or weapon.
- Enemies can also find items or weapons.
- Enemies will surprise attack you when exploring.
- As the player explores rooms, they drink beers and get drunk.
- Once the player drinks 3 beers, the number of visible rooms begins to decrease.
- For each beer drunk, an additional enemy is added to a room, increasing the player's chances of an encounter.
- Toxicity will decrease for enemy kills and can also randomly decrease through combat.

## Special Attacks
Special attacks can be found randomly attached to weapons and will be displayed underneath your block. A new menu option will appear when they are available. Only 1 special attack can be made per round, after which you must perform a strike or explore a room to recharge.

- Somersault: 50% success - strike or get struck 2-3 times by random enemies.
- Sneaky: Success lowered if the player is drunk. Surprise attacks will not happen while equipped. Steal the item of the enemy you are attacking and use it immediately. If your weapon is on its final use, it will steal the enemy's weapon and replace it.

- Stylish, Gambler & Psychic:
  - Win and strike, lose and get struck. Wins continue the streak, one loss ends it.
  - If the weapon breaks during a streak, you can continue to play using the player's base attack until your streak breaks.

- Gambler: Challenge the enemy to blackjack. Dealer's cards will not be revealed if the dealer does not draw, unless the dealer has blackjack. Draws count as a loss and end your streak. Blackjack will always win unless the dealer also has blackjack. Blackjack awards 2 strikes. Wins award one dollar.

- Psychic: Guess which room the enemy is hiding in and strike. Fail and get struck.
- Stylish: Like paper, scissors, rock. Pick a move and beat the enemy. Blue Steel > Magnum > Le Tigre > Blue Steel.
