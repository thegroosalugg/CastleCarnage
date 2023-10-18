# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(hunter, target, damage = 0, shot)
  x = rand(3) == 1 ? (shot == :missed ? BACK_TALK.sample : "🗯️ " + SMACK_TALK.sample) : ""

  hit =      "#{hunter[:name]} #{x}#{HIT} #{target[:name]} -#{damage} #{target[:emoji]}"
  critical = "#{hunter[:name]} #{x}#{CRITICAL} #{target[:name]} -#{damage} #{target[:emoji]}"
  missed =   "#{hunter[:name]} 🗯️❓ #{x}#{MISSED}"

  n, shout, comeback = case shot
  when :hit      then [100, hit, SMACK_BACK]
  when :critical then [100, critical, SMACK_BACK]
  when :missed   then [85, missed, TALK_BACK]
  end

  puts text_break(shout, " ", n)
  if !x.empty?
    puts text_break("#{target[:name]} 🗯️ #{comeback.sample}", " ", 85) if rand(2) == 1
  end
end

def strike(enemies, hunter, target)                        # dynamic damage multiplier
  damage = ((hunter[:attack] - target[:block]) * rand(0.6..1.4)).ceil.clamp(1, 100)

  if rand(1..hunter[:crit_ch]) == 1
    critical = (damage * hunter[:crit_x]).ceil.clamp(1, 100) # rounds any floating number up
    target[:hp] -= critical
    shots_fired(hunter, target, critical, :critical)
  elsif rand(1..hunter[:accuracy]) == 1
    shots_fired(hunter, target, :missed)
  else
    target[:hp] -= damage
    shots_fired(hunter, target, damage, :hit)
  end
  hunter[:uses] = (hunter[:uses] - 1).clamp(0, 5) if hunter[:equipped]
  weapon_breaks(hunter) if hunter[:equipped]
  graveyard(enemies, hunter, target)
end

# Sommersault attack

def somersault(chance, n)
  success = "#{SUCCESS} " + "⚔️ " * n
  failed = "#{FLUNKED} " + "😓 " * n

  messages = chance == 1 ? success : failed
  puts text_break(messages, " ", 85)
end

def somersault_attack(player, enemies)   # succeed and strike twice, fail and get struck thrice
  chance = rand(2)
  n = rand(2..3)
  somersault(chance, n)
  chance == 1 ? n.times { strike(enemies, player, enemies.sample ) unless enemies.empty? } : n.times { strike(enemies, enemies.sample, player) }
end

# Main game combat

def mortal_kombat(enemies, player)
  greeting(:combat)

  loop do
    state_of_game(enemies, player)
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    puts MENU_HEADER
    enemies.each_with_index { |enemy, index| puts " " * 28 + "#{ML}#{NUM[index + 4]}#{CL} #{enemy[:name]}" }
    puts BARRIER

    choice = gets.chomp.to_i - 4

    if enemies.any? && (0...enemies.length).include?(choice)
      print `clear`
      target = enemies[choice]
      strike(enemies, player, target)
      strike(enemies, target, player) if target[:hp].positive?
      surprise(enemies, player, :combat) unless enemies.empty? # random attack on player possible
      break
    else
      error(:input)
    end
  end
end

# activates when exploring rooms

def surprise(enemies, player, event)
  target_enemy = enemies.sample
  enemy_speaks(target_enemy, :escape) if event == :escape
  if rand(4) == 1
    enemy_speaks(target_enemy, :surprise)
    if rand(3) == 1
      enemy_speaks(player, :counter)
      strike(enemies, player, target_enemy)
    else
      strike(enemies, target_enemy, player)
    end
  end
end

def bounty(hunter, target)
  hunter[:kills] += 1
  hunter[:hp] = (hunter[:hp] + 10).clamp(0, 200)
  hunter[:cash] = (hunter[:cash] + 1).clamp(0, 5)
  hunter[:tracking] = target
  invoice(hunter, 0, :bounty) # amounts hardcoded as its always the same
end

def graveyard(enemies, hunter, target)
  if target[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
    enemy_speaks(target, :pwned)
    if hunter[:id] == :player
      bounty(hunter, target)
      enemies.delete(target)
    elsif target[:id] == :player
      target[:tracking] = hunter
    end
  end
end

def soul_checker(enemies, player)
  enemies.reject! do |enemy|
    if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
      enemy_speaks(enemy, :pwned)
      bounty(player, enemy)
      true  # This will remove the enemy from the array
    else
      false  # This will keep the enemy in the array
    end
  end
  player[:tracking] = enemies.sample if player[:hp] <= 0 && player[:tracking][:hp] <= 0 # Player dies and last enemy is tracked
end
