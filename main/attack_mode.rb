# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def strike(attacker, target, weapon = nil)
  source = attacker[:id] == :player ? weapon : attacker
  damage = rand(source[:attack]) - (target[:id] == :boss ? 0 : rand(target[:block])).clamp(1, 100)

  if rand(source[:crit_ch]) == 1
    critical = (damage * rand(source[:crit_x])).to_i.clamp(1, 150)
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

def somersault_attack(player, enemies, weapon)   # succeed and strike twice, fail and get struck thrice
  chance = rand(2)
  n = rand(2..3)
  somersault(chance, n)
  chance == 1 ? n.times { strike(player, enemies.sample, weapon) } : n.times { strike(enemies.sample, player) }
end

def mortal_kombat(enemies, player, weapon)
  greeting(:combat)
  user_choice = -1

  until user_choice >= 0 && user_choice < enemies.length
    state_of_game(enemies, player, weapon)
    puts "    Who yer gonna whack:"
    enemies.each_with_index { |enemy, index| puts "    [#{index + 4}] #{enemy[:name]}" }
    user_choice = gets.chomp.to_i - 4

    if user_choice >= 0 && user_choice < enemies.length
      print `clear`
      strike(player, enemies[user_choice], weapon)
      strike(enemies[user_choice], player) if enemies[user_choice][:hp].positive?
    else
      error_message
    end
  end
end

def escape_attempt(enemies, player, weapon)
  target_enemy = enemies.sample
  enemy_speaks(target_enemy, :escape)
  if rand(1..4) == 1
    enemy_speaks(target_enemy, :surprise)
    strike(target_enemy, player)
  end
  state_of_game(enemies, player, weapon) unless player[:hp] <= 0
end
