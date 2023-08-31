# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def player_attack(enemy, weapon)
  damage_dealt = [weapon[:damage].sample - enemy[:block].sample, 1].max
  #if (1..10).include?(weapon[:crit_ch].sample)
  if weapon[:crit_ch].sample == 1
    critical_damage = damage_dealt * weapon[:crit_x].call

    puts "[DEBUG]"
    puts damage_dealt
    puts critical_damage

    enemy[:hp] -= critical_damage
    crt_dmg_msg(enemy, weapon, critical_damage)
  elsif weapon[:accuracy].sample == 1
    missed(enemy)
    weapon[:durability] += 1
  else
    enemy[:hp] -= damage_dealt
    attack_msg(enemy, weapon, damage_dealt)
  end
  weapon[:durability] -= 1
end

def enemy_attack(enemy, player)
  enemy_damage = [enemy[:attack].sample - player[:block].sample, 1].max
  if enemy[:crit_ch].sample == 1
    enemy_critical = enemy_damage * enemy[:crit_x].call

    puts "[DEBUG]"
    puts enemy_damage
    puts enemy_critical

    player[:hp] -= enemy_critical
    enemy_crt_msg(enemy, enemy_critical)
  elsif enemy[:accuracy].sample == 1
    enemy_missed(enemy)
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
