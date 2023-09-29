# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def player_attack(enemy, weapon)
  damage_dealt = [weapon[:attack].sample - enemy[:block].sample, 1].max
  if weapon[:crit_ch].sample == 1
    critical_damage = damage_dealt * weapon[:crit_x].call
    enemy[:hp] -= critical_damage
    critical_hit(enemy, weapon, critical_damage)
  elsif weapon[:accuracy].sample == 1
    missed(enemy)
  else
    enemy[:hp] -= damage_dealt
    succesful_hit(enemy, weapon, damage_dealt)
  end
  weapon[:durability] = [weapon[:durability] - 1, 0].max
end

def enemy_attack(enemy, player)
  enemy_damage = [enemy[:attack].sample - player[:block].sample, 1].max
  if enemy[:crit_ch].sample == 1
    enemy_critical = enemy_damage * enemy[:crit_x].call
    player[:hp] -= enemy_critical
    enemy_crit(enemy, enemy_critical)
  elsif enemy[:accuracy].sample == 1
    enemy_missed(enemy)
  else
    player[:hp] -= enemy_damage
    enemy_hit(enemy, enemy_damage)
  end
end

def somersault_attack(enemy, weapon, player)
  if rand(1..3) == 1
    sommersault_success(enemy, weapon)
    player_attack(enemy, weapon); player_attack(enemy, weapon)
  else
    sommersault_fail(enemy)
    enemy_attack(enemy, player); enemy_attack(enemy, player); enemy_attack(enemy, player)
  end
end

def escape_attempt(enemy, second_enemy, player, weapon)
  enemy ? run_away(enemy) : run_away(second_enemy)
  if rand(1..1) == 1
    target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
    random_attack(target_enemy)
    enemy_attack(target_enemy, player)
  end
  state_of_game(enemy, second_enemy, player, weapon)
end
