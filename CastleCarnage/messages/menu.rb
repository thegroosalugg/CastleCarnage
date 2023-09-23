# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def load_menu
  t = [
    "   🥷 [t]: Strike first! Strike hard! No mercy!",
    "   🥷 [t]: Punch 'em in their stupid ugly face",
    "   🥷 [t]: Challenge 'em to a thrashing",
    "   🥷 [t]: Saturday Night Square Up!",
    "   🥷 [t]: 'Peaceful' resolution",
    "   🥷 [t]: Talk about Fight Club",
    "   🥷 [t]: T is for time to die!",
    "   🥷 [t]: Mash 'em up, innit",
    "   🥷 [t]: Your soul is mine!",
    "   🥷 [t]: Pay 'em a beating",
    "   🥷 [t]: Choose violence",
    "   🥷 [t]: Do 'em in",
  ]

  r = [
    "   🐬 [r]: Try something, but probably fail",
    "   🐬 [r]: Last Chance Crusade",
    "   🐬 [r]: Do Something Stupid",
    "   🐬 [r]: Go Super Saiyan 😼",
    "   🐬 [r]: Try a sommersault!",
    "   🐬 [r]: Throw Pokéball 🚫",
    "   🐬 [r]: Parkour, parkour!",
    "   🐬 [r]: Do a Barrel Roll",
    "   🐬 [r]: 🟪🟦🟥🟧🟨🟩",
    "   🐬 [r]: Do a sick flip",
    "   🐬 [r]: Roundhouse!",
  ]

  y = [
    "   💨 [y]: Run in the opposite direction!",
    "   💨 [y]: Dishonourable discharge",
    "   💨 [y]: Fuckin' leg it!",
    "   💨 [y]: Look fo' swag",
    "   💨 [y]: Cheese it!",
    "   💨 [y]: Skive off",
    "   💨 [y]: 'llow it!",
    "   💨 [y]: Melt out",
    "   💨 [y]: Peg it!",
    "   💨 [y]: Bunk it",
    "   💨 [y]: Bounce",
    "   💨 [y]: Mug it",
  ]

  puts "       Whatcha ya gonna do?"
  puts t.sample
  puts r.sample
  puts y.sample
end

# GAME STATUS

def state_of_game(enemy, second_enemy, player, weapon)
  puts "----------------------------------------------------------------------"
  puts "    #{enemy[:name]} HP: #{enemy[:hp].to_i} #{'🤍' * [enemy[:hp] / 20, 0].max}" if enemy
  puts "    👊 Attack: #{'🔶' * (enemy[:attack].min / 20)}#{'🔸' * (enemy[:attack].min / 5 % 4)} to #{'🔶' * (enemy[:attack].max / 20)}#{'🔸' * (enemy[:attack].max / 5 % 4)} || 🛡️ Block #{'🔷' * (enemy[:block].min / 5)}#{'🔹' * (enemy[:block].min % 5)} to #{'🔷' * (enemy[:block].max / 5)}#{'🔹' * (enemy[:block].max % 5)}" if enemy
  puts "----------------------------------------------------------------------" if enemy
  puts "    #{second_enemy[:name]} HP: #{second_enemy[:hp].to_i} #{'🤍' * [second_enemy[:hp] / 20, 0].max}" if second_enemy
  puts "    👊 Attack: #{'🔶' * (second_enemy[:attack].min / 20)}#{'🔸' * (second_enemy[:attack].min / 5 % 4)} to #{'🔶' * (second_enemy[:attack].max / 20)}#{'🔸' * (second_enemy[:attack].max / 5 % 4)} || 🛡️ Block #{'🔷' * (second_enemy[:block].min / 5)}#{'🔹' * (second_enemy[:block].min % 5)} to #{'🔷' * (second_enemy[:block].max / 5)}#{'🔹' * (second_enemy[:block].max % 5)}" if second_enemy
  puts "----------------------------------------------------------------------" if second_enemy
  puts "    💖 Your HP: #{player[:hp].to_i} #{'❤️' * [player[:hp] / 20, 0].max}"
  puts "    🛡️ Block: #{'🔷' * (player[:block].min / 5)}#{'🔹' * (player[:block].min % 5)} to #{'🔷' * (player[:block].max / 5)}#{'🔹' * (player[:block].max % 5)}"
  puts "    ⚔️ Weapon: #{weapon[:name]}" if weapon[:durability].positive?
  puts "    💥 Damage: #{'🔶' * (weapon[:damage].min / 20)}#{'🔸' * (weapon[:damage].min / 5 % 4)} to #{'🔶' * (weapon[:damage].max / 20)}#{'🔸' * (weapon[:damage].max / 5 % 4)} || 🪶 Uses: #{'🟦' * [weapon[:durability], 0].max}" if weapon[:durability].positive?
  puts "----------------------------------------------------------------------"
end

# ERROR MESSAGES

def error_message
  errors = [
    "***********************❌ Don't be a pillock ‼ ***********************",
    "***********************❌ Don't be a plonker ‼ ***********************",
    "***********************❌ Don't be a plank ‼ *************************",
    "***********************❌ Don't be a plum ‼ **************************",
    "***********************❌ Don't be a fool ‼ **************************",
    "***********************❌ Nobody likes a joker ‼ *********************",
    "***********************❌ Quit clowning around ‼ *********************",
    "***********************❌ Quit faffing around ‼ **********************",
    "***********************❌ Quit being a melon ‼ ***********************",
  ]

  print `clear`
  puts "----------------------------------------------------------------------"
  puts errors.sample
  puts "----------------------------------------------------------------------"
end
