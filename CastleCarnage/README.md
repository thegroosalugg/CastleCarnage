The game is made just for fun, not to be taken seriously.
The purpose is to practice writing Ruby code and refactoring.

************************* UI **************************

🥷 You / 289 💔 / 💔💔💔💔💔💔💔💔<br>
🛡️ Min 🔹 Max 🔷🔷<br>
〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰<br>
🏹 Crossbow / 🎯 84% / 💥 9% / 💢 Min 🔶🔸🔸 Max 🔶🔶🔸🔸 / 🛠️ 🟦🟦🟦🟦<br>
〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰<br>
👹 Orc / 249 ❤️ / ❤️❤️❤️❤️❤️❤️❤️<br>
🎯 88% / 💥 10% / 💢 Min 🔶🔸 Max 🔶🔸🔸🔸 / 🛡️ Min 🔹🔹🔹🔹 Max 🔷🔷🔹🔹<br>
<br>
289 💔 > health in integers. Emojis will change each playthrough<br>
💔💔💔 > life bars. One heart = 40hp. If you have under 40, one heart will display<br>
💢 Min 🔶🔸🔸 Max 🔶🔶🔸🔸 > Attack Range. 🔸 = 5 | 🔶 = 20 | One 🔸 will always display if attack is under 5; for instance 🔶🔶🔸🔸🔸🔸 = attack between 55-60; 🔶🔶🔶 = 60; 🔶🔶🔶🔸 = 60-65 etc.<br>
🛡️ Min 🔹 Max 🔷🔷 > Block Range. 🔹 = 1 | 🔷 = 5 | Simples.<br>
🎯 84% > Accuracy<br>
💥 10% > Critical Chance<br>
********************** MAIN GAME **********************

Select [t] to attack the enemy with your weapon, but the enemy will attack back at the same time.
> Each attack removes 1 durability. Once your weapon breaks you can no longer attack and must search the rooms for a new weapon.<br>
> When there are 2 enemies, you attack both and they both respond in one combat. You will lose 2 durability for attacking, but you can still attack both if your weapon has only 1 durability remaining.<br>
> If you and the enemy simultaneously kill each other, you still lose. That's just how life goes.<br>

Select [r] to try a sommersault, if successful you attack twice without taking damage.
> If you fail, the enemy attacks you 3 times without taking damage. The dangers of failure must always outweigh the benefits of success, that's why it's called a risk.<br>
> If there are 2 enemies present, 1 is chosen at random for the attack. You cannot attack both and failure will result in only 1 enemy attacking you<br>

Select [y] to run through rooms and get random outcomes based on the room chosen
> The room's chances are an array of length 4-12, with integers of values 1-7 inside. Duplicates are allowed, thus certain outcomes are more probable than others.<br>
> Your decision matters, the probability is set when the rooms are displayed, but what you get from the room is decided as it is chosen.<br>
> If you avoid combat and only explore rooms, the enemy can randomly attack you.<br>
> If you keep attacking, your weapon will break and you will be forced to run through rooms.<br>

Escape the castle by defeating all enemies, however exploring rooms can spawn a second enemy, causing the loop to run indefinitely.
> Defeating the first enemy while the second enemy is active can cause another enemy to spawn in its place in one of the rooms.<br>
> Rooms explored and enemies defeated are recorded. Remain in the castle long enough and trigger the boss battle.<br>
> Both counters modify player health and atack/block for the battle.<br>

********************** BIG BOSS **********************

IS COMING
