# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def strike(attacker, target, weapon = nil)
  source = attacker[:id] == :player ? weapon : attacker
  damage = (rand(source[:attack]) - rand(target[:block])).clamp(0, 100)

  if rand(source[:crit_ch]) == 1
    critical = (damage * rand(source[:crit_x])).to_i.clamp(0, 150)
    target[:hp] -= critical
    shots_fired(attacker, target, critical, :critical)
  elsif rand(source[:accuracy]) == 1
    shots_fired(attacker, target, :missed)
  else
    target[:hp] -= damage
    shots_fired(attacker, target, damage, :hit)
  end
  weapon[:durability] = [weapon[:durability] - 1, 0].max if attacker[:id] == :player
end

def somersault_attack(player, enemy, weapon)   # succeed and strike twice, fail and get struck thrice
  chance = rand(1..3)
  somersault(chance, enemy)
  chance == 1 ? 2.times { strike(player, enemy, weapon) } : 3.times { strike(enemy, player) }
end

def escape_attempt(enemy, second_enemy, player, weapon)
  target_enemy = (enemy && second_enemy) ? [enemy, second_enemy].sample : enemy || second_enemy
  enemy_speaks(target_enemy, :escape)
  if rand(1..5) == 1
    enemy_speaks(target_enemy, :surprise)
    strike(target_enemy, player)
  end
  state_of_game(enemies, player, weapon) unless player[:hp] <= 0
end
