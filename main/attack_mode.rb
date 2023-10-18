# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Player vs enemy strike

def shots_fired(hunter, target, shot)
  text = rand(3) == 1 ? (shot == :missed ? BACK_TALK.sample : "🗯️ " + SMACK_TALK.sample) : ""

  hit  = "#{hunter[:name]} #{text}#{HIT} #{target[:name]} -#{hunter[:damage]} #{target[:emoji]}"
  crit = "#{hunter[:name]} #{text}#{CRIT} #{target[:name]} -#{hunter[:damage]} #{target[:emoji]}"
  miss = "#{hunter[:name]} 🗯️❓ #{text}#{MISS} #{target[:name]}"

  shout, comeback = case shot
  when :hit  then [hit,  SMACK_BACK]
  when :crit then [crit, SMACK_BACK]
  when :miss then [miss,  TALK_BACK]
  end

  puts text_break(shout, " ", 100)
  puts text_break("#{target[:name]} 🗯️ #{comeback.sample}", " ", 85) if !text.empty? && rand(2) == 1
end

def strike(enemies, hunter, target)                        # dynamic damage multiplier
  hunter[:damage] = ((hunter[:attack] - target[:block]) * rand(0.6..1.4)).ceil.clamp(1, 100)

  if rand(1..hunter[:crit_ch]) == 1
    hunter[:damage] = (hunter[:damage] * hunter[:crit_x]).ceil.clamp(1, 100) # rounds any floating number up
    target[:hp] -= hunter[:damage]
    shots_fired(hunter, target, :crit)
  elsif rand(1..hunter[:accuracy]) == 1
    shots_fired(hunter, target, :miss)
  else
    target[:hp] -= hunter[:damage]
    shots_fired(hunter, target, :hit)
  end

  hunter[:uses] = (hunter[:uses] - 1).clamp(0, 5) if hunter[:equipped]
  weapon_breaks(hunter) if hunter[:equipped]
  graveyard(enemies, (hunter[:id] == :player ? hunter : target)) # graveyard checks for enemy deaths and collects bounty

  if target[:id] == :player && target[:hp] <= 0
    target[:tracking] = hunter   # if player dies tracks enemy who dealt lethal blow
    enemy_speaks(target, :pwned) # sends same pwned message to the player
  end
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
    game_info(enemies, player)
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    puts MENU_HEADER
    enemies.each_with_index { |enemy, index| puts " " * 28 + "#{ML}#{NUM[index + 4]}#{CL} #{enemy[:name]}" }
    puts BARRIER

    choice = gets.chomp.to_i - 4

    if enemies.any? && (0...enemies.length).include?(choice)
      print `clear`
      target = enemies[choice]
      strike(enemies, player, target)
      strike(enemies, target, player) if target[:hp].positive? && player[:hp].positive?
      surprise(enemies, player, :combat) unless enemies.empty? || player[:hp] <= 0 # random attack on player possible
      break
    else
      error(:input)
    end
  end
end

# activates when exploring rooms

def surprise(enemies, player, event) # surprise attack
  target_enemy = enemies.sample
  enemy_speaks(target_enemy, :escape) if event == :escape # only when exploring rooms
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
  hunter[:hp] = (hunter[:hp] + 10).clamp(0, 150)
  hunter[:cash] = (hunter[:cash] + 1).clamp(0, 5)
  hunter[:tracking] = target
  invoice(hunter, 0, :bounty) # amounts hardcoded as they're static
end

def graveyard(enemies, player) # graveyard checks for enemy deaths and collects bounty
  enemies.reject! do |enemy|
    if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
      enemy_speaks(enemy, :pwned)
      bounty(player, enemy)
      true  # This will remove the enemy from the array
    else
      false  # This will keep the enemy in the array
    end
  end # Player dies and last enemy is tracked if current tracked enemy is already dead
  player[:tracking] = enemies.sample if player[:hp] <= 0 && player[:tracking][:hp] <= 0
end
