# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def strike(enemies, hunter, target) # all entities use this to fight
  load_ammo(hunter) # check for items and weapons
  block = target[:weapon] ? target[:weapon][:block] : target[:block]
  hunter[:damage] = ((hunter[:source][:attack] - block) * rand(0.6..1.4)).ceil.clamp(2, 100) # dynamic damage multiplier

  if hunter[:source][:aim] > rand(0..9)
    if hunter[:source][:chance] > rand(0..9)
      hunter[:damage] = (hunter[:damage] * hunter[:source][:crit]).ceil.clamp(2, 100) # rounds any floating number up
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
    target[:screen]   = { id: :flash, offset: 2, art: "#{RD}#{GAME_OVER}#{CL}" } # sets the scene
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
  end                       # removed clamp as don't want to pass player here to add clamp scaling. Not much hp is gained from items
end

def shots_fired(hunter, target, shot) # Player vs enemy strike
  text = rand(3) == 1 ? (shot == :miss ? BACK_TALK.sample : "🗯️ " + FIGHT_TALK.sample) : ""

  hit  = "#{hunter[:name]} #{text}#{HIT} #{target[:name]} #{target[:emoji]}-#{hunter[:damage]}"
  crit = "#{hunter[:name]} #{text}#{CRIT} #{target[:name]} #{target[:emoji]}-#{hunter[:damage]}"
  miss = "#{hunter[:name]} 🗯️❓ #{text}#{MISS} #{target[:name]}"

  x, shout, comeback = case shot
  when :hit  then [100, hit,  FIGHT_BACK]
  when :crit then [110, crit, FIGHT_BACK]
  when :miss then [100, miss,  TALK_BACK]
  end

  puts text_break(shout, " ", x)
  puts text_break("#{target[:name]} 🗯️ #{comeback.sample}", " ", 85) if !text.empty? && rand(2) == 1
end

def graveyard(enemies, player)
  enemies.reject! do |enemy|
    if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
      shout(enemy, :pwned)
      bounty(player, enemy)
      player[:screen]  = { id: :flash, offset: 4, art: "#{CN}#{ENEMY_PWNED}#{CL}" }
      true  # This will remove the enemy from the array
    else false  # This will keep the enemy in the array
    end
  end
  player[:screen]  = { id: :flash, offset: 2, art: "#{GN}#{GAME_WON}#{CL}" } if enemies.empty?
end

def bounty(hunter, target) # collect bounty
  hunter[:tracks] = target
  hunter[:xp] += 10
  hunter[:cash]   = (hunter[:cash]  + 1).clamp(0,   5)
  hunter[:beers]  = (hunter[:beers] - 1).clamp(0,   5)
  hunter[:hp]     = (hunter[:hp]   + 10).clamp(0, hunter[:max_hp])
  shout(hunter, :bounty) # amounts hardcoded as they're static
end
