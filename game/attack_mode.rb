# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def player_attack(enemy, weapon)
  damage_dealt = [weapon[:damage].sample - enemy[:block].sample, 1].max
  if rand(1..10) == 1
    critical_damage = damage_dealt * rand(1.4..2.0)
    enemy[:hp] -= critical_damage
    puts "Critical🌟! You smashed #{enemy[:name]} with your #{weapon[:name]} for #{critical_damage.to_i} damage!"
  elsif rand(1..10) == 2
    puts "While charging the enemy you wanked it up and fell on your face 😣, dealing absolutely no damage. You plank."
    weapon[:durability] += 1
  else
    enemy[:hp] -= damage_dealt
    puts "You attacked #{enemy[:name]} with your #{weapon[:name]} for #{damage_dealt} damage!"
  end
  weapon[:durability] -= 1
end

def enemy_attack(enemy, player)
  enemy_damage = [enemy[:attack].sample - player[:block].sample, 1].max
  if rand(1..10) == 1
    enemy_critical = enemy_damage * rand(1.4..2.0)
    player[:hp] -= enemy_critical
    puts "Oh Shit! #{enemy[:name]} battered you for #{enemy_critical.to_i} critical🌟 damage! You look like a mashed potato mate!"
  elsif rand(1..10) == 2
    puts "#{enemy[:name]} got confused and ran straight into a wall 😣, you got lucky."
  else
    player[:hp] -= enemy_damage
    puts "The #{enemy[:name]} struck you back for #{enemy_damage} damage! Better think fast"
  end
end

def somersault_attack(enemy, weapon, player)
  if rand(1..3) == 1
    puts "You ran up the wall and did a sick backflip, you strike #{enemy[:name]} twice!"
    player_attack(enemy, weapon); player_attack(enemy, weapon)
  else
    enemy_attack(enemy, player); enemy_attack(enemy, player); enemy_attack(enemy, player)
    puts "You stacked it! #{enemy[:name]} is having a field day, you plum!"
  end
end
