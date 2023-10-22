# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def mortal_kombat(enemies, player) # Main game combat
  shout(enemies.sample, :combat)

  loop do
    game_info(enemies, player)
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    puts MENU_HEADER
    enemies.each_with_index { |enemy, index| puts " " * 26 + "#{ML}#{NUM[index + 4]}#{CL} #{enemy[:name]}" }
    puts BARRIER

    choice = gets.chomp.to_i - 4

    if enemies.any? && (0...enemies.length).include?(choice)
      print `clear`
      target = enemies[choice]
      if player[:weapon] && !player[:weapon][:bonus].empty? && player[:weapon][:bonus] != :somersault then combat_menu(enemies, player, target)
      else brawl(enemies, player, target)
      end
      break # ends combat
    else shout(enemies.sample, :error)
    end
  end
end

def combat_menu(enemies, player, target) # second menu if special attacks present
  shout(target, :combat)
  choice = 0

  until[4, 5].include?(choice)
    player[:land] = { id: :move, art: BATTLEFIELD.sample }
    game_info(enemies, player)
    load_menu(player, :combat)
    choice = gets.chomp.to_i
    print `clear`

    if choice == 4 then brawl(enemies, player, target)
    elsif choice == 5
      if player[:weapon][:bonus] == :gambler then blackjack(enemies, player, target)
      else shout(target, :error); redo
      end
    else shout(target, :error)
    end
  end
end

def brawl(enemies, player, target) # Regular brawl will take place without specials
  strike(enemies, player, target)
  strike(enemies, target, player) if target[:hp].positive? && player[:hp].positive?
  surprise(enemies, player) unless enemies.empty? || player[:hp] <= 0 # random attack on player possible
end

def surprise(enemies, player) # surprise attack
  target = enemies.sample
  if rand(4) == 1 then shout(target, :surprise)
    if rand(3) == 1
      shout(player, :counter)
      strike(enemies, player, target)
    else strike(enemies, target, player)
    end
  end
end

def strike(enemies, hunter, target) # all entities use this to fight
  load_ammo(hunter) # check for items and weapons
  block = target[:weapon] ? target[:weapon][:block] : target[:block]
  hunter[:damage] = ((hunter[:source][:attack] - block) * rand(0.6..1.4)).ceil.clamp(1, 100) # dynamic damage multiplier

  if hunter[:source][:aim] > rand(0..9)
    if hunter[:source][:chance] > rand(0..9)
      hunter[:damage] = (hunter[:damage] * hunter[:source][:crit]).ceil.clamp(1, 100) # rounds any floating number up
      shots_fired(hunter, target, :crit)
    else shots_fired(hunter, target, :hit)
    end
    target[:hp] -= hunter[:damage]
  else shots_fired(hunter, target, :miss)
  end

  weapon_breaks(hunter) if hunter[:weapon]
  graveyard(enemies, (hunter[:id] == :player ? hunter : target)) # checks for enemy deaths and collects bounty
  hunter[:item]     = nil # item is used up and destroyed

  if target[:id]   == :player && target[:hp] <= 0
    target[:tracks] = hunter   # if player dies tracks enemy who dealt lethal blow
    shout(target, :pwned) # sends same pwned message to the player
  end
end

def load_ammo(hunter)
 hunter[:source] = hunter[:weapon] ? hunter[:weapon] : hunter # assigns unarmed or weapon as combat source
  if hunter[:item] # if item exists, all of the source's stats is added to item's stats except HP
    shout(hunter, :used) # item stats declared before any calculations affect it
   hunter[:source].each do |key, value|
      if hunter[:item].key?(key)
        hunter[:item][key] += value unless key == :hp
      end
    end
    hunter[:source]         = hunter[:item] # source becomes item for strike, as we do not want to alter wielder/weapon stats
    hunter[:hp]            += hunter[:item][:hp] # HP adds separately
  end
end

def shots_fired(hunter, target, shot) # Player vs enemy strike
  text = rand(3) == 1 ? (shot == :miss ? BACK_TALK.sample : "🗯️ " + SMACK_TALK.sample) : ""

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

def graveyard(enemies, player)
  enemies.reject! do |enemy|
    if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
      shout(enemy, :pwned)
      bounty(player, enemy)
      true  # This will remove the enemy from the array
    else false  # This will keep the enemy in the array
    end
  end # Player dies and last enemy is tracked if current tracked enemy is already dead
  player[:tracks] = enemies.sample if player[:hp] <= 0 && player[:tracks][:hp] <= 0
end

def bounty(hunter, target) # collect bounty
  hunter[:tracks] = target
  hunter[:kills] += 1
  hunter[:cash]   = (hunter[:cash] + 1).clamp(0, 5)
  hunter[:hp]     = (hunter[:hp] + 10).clamp(0, 150)
  shout(hunter, :bounty) # amounts hardcoded as they're static
end

def somersault(enemies, player) # Sommersault attack
  player[:flip] = rand(2)    # winner strikes loser 2-3 times, targets random
  player[:roll] = rand(2..3)
  shout(player, :bounce)
  hunter, target = player[:flip] == 1 ? [ [player], enemies ] : [ enemies, [player] ]
  player[:roll].times { strike(enemies, hunter.sample, target.sample) unless enemies.empty? }
end
