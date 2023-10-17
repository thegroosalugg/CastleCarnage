# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(raider, target, damage = 0, shot)
  x = rand(3) == 1 ? (shot == :missed ? BACK_TALK.sample : "🗯️ " + SMACK_TALK.sample) : ""

  hit =      "#{raider[:name]} #{x}#{HIT} #{target[:name]} -#{damage} #{target[:emoji]}"
  critical = "#{raider[:name]} #{x}#{CRITICAL} #{target[:name]} -#{damage} #{target[:emoji]}"
  missed =   "#{raider[:name]} 🗯️❓ #{x}#{MISSED}"

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

def strike(enemies, raider, target)                        # dynamic damage multiplier
  damage = ((raider[:attack] - target[:block]) * rand(0.6..1.4)).ceil.clamp(1, 100)

  if rand(1..raider[:crit_ch]) == 1
    critical = (damage * raider[:crit_x]).ceil.clamp(1, 100) # rounds any floating number up
    target[:hp] -= critical
    shots_fired(raider, target, critical, :critical)
  elsif rand(1..raider[:accuracy]) == 1
    shots_fired(raider, target, :missed)
  else
    target[:hp] -= damage
    shots_fired(raider, target, damage, :hit)
  end
  raider[:uses] = (raider[:uses] - 1).clamp(0, 5) if raider[:equipped]
  weapon_breaks(raider) if raider[:equipped]
  graveyard(enemies, raider, target)
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

def graveyard(enemies, raider, target)
  if target[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
    enemy_speaks(target, :pwned)
    if raider[:id] == :player
      raider[:kills] += 1
      raider[:hp] = (raider[:hp] + 10).clamp(0, 200)
      raider[:cash] = (raider[:cash] + 1).clamp(0, 5)
      raider[:tracking] = target
      enemies.delete(target)
      puts text_break("#{BONUS} #{raider[:name]} +10 #{raider[:emoji]} + 1 💵", " ", 90)
    elsif target[:id] == :player
      target[:tracking] = raider
    end
  end
end
