# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(raider, target, damage = 0, shot)
  x = rand(3) == 1 ? (shot == :missed ? BACK_TALK.sample : "🗯️ " + SMACK_TALK.sample) : ""

  hit = "#{raider[:name]} #{x} #{HIT} #{target[:name]} -#{damage} #{target[:emoji]}"
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

def strike(raider, target)                        # dynamic damage multiplier
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
  chance == 1 ? n.times { strike(player, enemies.sample ) } : n.times { strike(enemies.sample, player) }
end

# Main game combat

def mortal_kombat(enemies, player)
  greeting(:combat)
  choice = -1

  until choice >= 0 && choice < enemies.length
    state_of_game(enemies, player)
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    puts MENU_HEADER
    enemies.each_with_index { |enemy, index| puts " " * 28 + "#{ML}#{NUM[index + 4]}#{CL} #{enemy[:name]}" }
    puts BARRIER                                       # fetches and colors ASCII numbers
    choice = gets.chomp.to_i - 4

    if choice >= 0 && choice < enemies.length
      print `clear`
      strike(player, enemies[choice])
      strike(enemies[choice], player) if enemies[choice][:hp].positive?
      surprise(enemies, player, :combat) if enemies[choice][:hp].positive? # random attack on player possible
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
      strike(player, target_enemy)
    else
      strike(target_enemy, player)
    end
  end
end
