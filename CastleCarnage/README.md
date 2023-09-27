The game is made just for fun, not to be taken seriously.
The purpose is to practice writing Ruby code and refactoring.

********************** MAIN GAME **********************

Select [t] to attack the enemy with your weapon, but the enemy will attack back at the same time.
> Each attack removes 1 durability. Once your weapon breaks you can no longer attack and must search the rooms for a new weapon.
> When there are 2 enemies, you attack both and they both respond in one combat. You will lose 2 durability for attacking, but you can still attack both if your weapon has only 1 durability remaining. 
> If you and the enemy simultaneously kill each other, you still lose. That's just how life goes. 

Select [r] to try a sommersault, if successful you attack twice without taking damage.
> If you fail, the enemy attacks you 3 times without taking damage. The dangers of failure must always outweigh the benefits of success, that's why it's called a risk.
> If there are 2 enemies present, 1 is chosen at random for the attack. You cannot attack both and failure will result in only 1 enemy attacking you

Select [y] to run through rooms and get random outcomes based on the room chosen
> The room's chances are an array of length 4-12, with integers of values 1-7 inside. Duplicates are allowed, thus certain outcomes are more probable than others.
> Your decision matters, the probability is set when the rooms are displayed, but what you get from the room is decided as it is chosen.
> If you avoid combat and only explore rooms, the enemy can randomly attack you.
> If you keep attacking, your weapon will break and you will be forced to run through rooms.

Escape the castle by defeating all enemies, however exploring rooms can spawn a second enemy, causing the loop to run indefinitely.
> defeating the first enemy while the second enemy is active can cause another enemy to spawn in its place in one of the rooms.
> rooms explored and enemies defeated are recorded. Remain in the castle long enough and trigger the boss battle.
> both counters modify player health and atack/block for the battle.

********************** BIG BOSS **********************

IS COMING
