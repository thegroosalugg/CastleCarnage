 ______     ______     ______     ______   __         ______        ______     ______     ______     __   __     ______     ______     ______    
/\  ___\   /\  __ \   /\  ___\   /\__  _\ /\ \       /\  ___\      /\  ___\   /\  __ \   /\  == \   /\ "-.\ \   /\  __ \   /\  ___\   /\  ___\   
\ \ \____  \ \  __ \  \ \___  \  \/_/\ \/ \ \ \____  \ \  __\      \ \ \____  \ \  __ \  \ \  __<   \ \ \-.  \  \ \  __ \  \ \ \__ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \/\_____\    \ \_\  \ \_____\  \ \_____\     \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \_\\"\_\  \ \_\ \_\  \ \_____\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_____/     \/_/   \/_____/   \/_____/      \/_____/   \/_/\/_/   \/_/ /_/   \/_/ \/_/   \/_/\/_/   \/_____/   \/_____/ 
                                                                                                                                                 

The game is made just for fun, not to be taken seriously
The purpose is to practice writing Ruby code and refactoring

Select [t] to attack the enemy, but the enemy will attack back at the same time

Select [r] to try a sommersault, if successful you attack twice without taking damage
> If you fail, the enemy attacks you 3 times without taking damage

Select [y] to run through rooms and get random outcomes based on the room chosen
> The probability of what's inside the room will always change. even if you've been to the room before
> Your decision matters, the probability is set when the rooms are displayed, not after your input
> If you avoid combat and only explore rooms, the enemy can randomly attack you
> If you keep attacking, your weapon will break and you will be forced to run through rooms

Escape the castle by defeating all enemies, however exploring rooms can spawn a second enemy, causing the loop to run indefinitely
> defeating the first enemy while the second enemy is active can cause another enemy to spawn in its place in one of the rooms
> rooms explored and enemies defeated are recorded. Remain in the castle long enough and trigger the boss battle
> both counters modify player health and block for the battle
