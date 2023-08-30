# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# INTRO MESSAGES

def intro_enemy(enemy)
  enemy_phrases = [
    "#{enemy[:name]} busted through the door, they're stark raving mad. They're out for blood!",
    "You got too pissed and ended up in castle, a #{enemy[:name]} jumped from the ceiling, 'You goon get it now boy!'",
    "You got caught ganking hooch from the butcher's, the clerics set the #{enemy[:name]} on you!"
  ]

  puts enemy_phrases.sample
end

def intro_weapon(weapon, enemy)
  weapon_phrases = [
    "There's a #{weapon[:name]} on the floor, better get that. We won't get got, we gone get!",
    "You pull out your trusty #{weapon[:name]} from your trench coat and tip your fedora, 'The only thing sharper than my #{weapon[:name]} is my wit m'lady'",
    "You teleport behind #{enemy[:name]} and withdraw your #{weapon[:name]}, 'Nothing personnel, kid'"
  ]

  puts weapon_phrases.sample
end

# MAIN MENU

def load_menu
  puts "Whatcha ya gonna do?"
  puts "🐱‍👤 [t]: T is for time to die fucker!"
  puts "  ➰  [r]: Try a sommersault!"
  puts "  👟  [y]: Fuckin' leg it!"
end

# DYNAMIC ENEMY AND PLAYER STATUS

def state_of_game(enemy, second_enemy, player, weapon)
puts "______________________________________________________________________"
  puts "#{enemy[:name]} HP: #{enemy[:hp].to_i}" if enemy
  puts "#{second_enemy[:name]} HP: #{second_enemy[:hp].to_i}" if second_enemy
  puts "💖 Your HP: #{player[:hp].to_i}"
  puts "⚔  Weapon: #{weapon[:name]} [DEBUG: #{weapon[:durability]}]" if weapon[:durability] > 0
  puts "______________________________________________________________________"
end

# ERROR MESSAGES

def error_message
  errors = [
    "❌ Don't be a pillock ‼",
    "❌ Don't be a plum ‼",
    "❌ Don't be a plank ‼",
    "❌ Don't be a plonka ‼",
    "❌ Don't be a fool ‼",
    "❌ Quit clowning around ‼"
  ]

  print `clear`
  puts "______________________________________________________________________"
  puts errors.sample
  puts "______________________________________________________________________"
end

# DYNAMIC GAME MESSAGES

def weapon_broke(weapon)
  weapon_messages = [
    "😲 Oh shit! Your #{weapon[:name]} broke. Better leg it!",
    "😲 Motherfucker! you dropped your #{weapon[:name]}! No time to pick it, gotta bolt!",
    "😲 While swinging about your #{weapon[:name]} slipped out of your hand and flew out of a window. Time to split!"
  ]

  puts weapon_messages.sample
end

def enemy_killed(enemy)
  enemy_messages = [
    "#{enemy[:name]} died. Bully for you!",
    "You blasted #{enemy[:name]}! Flawless Victory.",
  ]
  puts "______________________________________________________________________"
  puts enemy_messages.sample
end

# END OF GAME MESSAGES

def win_message(enemy)
  win_messages = [
    "You blasted #{enemy[:name]} to another dimension. Your power level has increased.",
    "You splatted the #{enemy[:name]} like a bug, flawless victory.",
    "#{enemy[:name]} had a sudden heart attack, you win by default."
  ]

  puts win_messages.sample
  puts "______________________________________________________________________"
end

def lose_message(enemy)
  lose_messages = [
    "You Died! #{enemy[:name]} shall feast on your entrails.",
    "#{enemy[:name]} ripped your head off. You won't be coming home for dinner.",
    "You stacked it and fell on a spike. #{enemy[:name]} laughs at your misfortune."
  ]

  puts lose_messages.sample
  puts "______________________________________________________________________"
end
