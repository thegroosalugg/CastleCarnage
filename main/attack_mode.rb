# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def strike(attacker, target, weapon = nil)
  damage_source = attacker[:id] == "player" ? weapon : attacker
  damage_dealt = [damage_source[:attack].sample - target[:block].sample, 1].max

  if damage_source[:crit_ch].sample == 1
    critical_damage = (damage_dealt * damage_source[:crit_x].call).to_i
    target[:hp] -= critical_damage
    critical_hit(attacker, target, critical_damage)
  elsif damage_source[:accuracy].sample == 1
    missed(attacker, target)
  else
    target[:hp] -= damage_dealt
    succesful_hit(attacker, target, damage_dealt)
  end
  weapon[:durability] = [weapon[:durability] - 1, 0].max if attacker[:id] == "player"
end

def somersault_attack(player, enemy, weapon)   # succeed and strike twice, fail and get struck thrice
  chance = rand(1..3)
  somersault(chance, enemy)
  chance == 1 ? 2.times { strike(player, enemy, weapon) } : 3.times { strike(enemy, player) }
end

def escape_attempt(enemy, second_enemy, player, weapon)
  target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
  run_away(target_enemy)
  if rand(1..5) == 1
    random_attack(target_enemy)
    strike(target_enemy, player)
  end
  state_of_game(enemy, second_enemy, player, weapon)
end
