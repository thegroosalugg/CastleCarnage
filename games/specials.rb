# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def brawl(enemies, player, target) # Regular brawl when player strikes
  player[:screen]   = { id: :flash, offset: 10, art: "#{YL}#{STRIKE.sample}#{CL}" }
  strike(enemies, player, target)
  strike(enemies, target, player) if target[:hp].positive?
  surprise(enemies, player) unless enemies.empty? || player[:hp] <= 0 || (player[:weapon] && player[:weapon][:bonus] == :sneaky)
  player[:xp]   += 1
  player[:drain] = false
  player[:shop]  = false #  shop is disabled each round whether accessed or not
  player[:shop]  = true if player[:cash].positive? && rand(4) == 1 # shop opens for one round
  if rand(10) == 1 && player[:hp].positive?
    player[:beers] = (player[:beers] - 1).clamp(0, 5)
    shout(player, :sober)
  end
end

def surprise(enemies, player) # surprise attack
  target = enemies.sample
  if rand(4) == 1 then shout(target, :surprise)
    if rand(3) == 1 then shout(player, :counter)
      strike(enemies, player, target)
    else strike(enemies, target, player)
    end
  end
end

def somersault(enemies, player) # Sommersault attack
  player[:flip] = rand(2)    # winner strikes loser 2-3 times, targets random
  player[:roll] = rand(2..3)
  shout(player, :bounce)
  hunter, target = player[:flip] == 1 ? [ [player], enemies ] : [ enemies, [player] ] # don't want to repeat myself, but need target to be random
  player[:screen]   = { id: :flash, offset: 4, art: (player[:flip] == 1 ? "#{GN}#{SOMERSAULT}#{CL}" : "#{RD}#{LOSER}#{CL}") }
  player[:roll].times { strike(enemies, hunter.sample, target.sample) unless enemies.empty? } # player is in an array so .sample can be run on either
end

def sneak_attack(enemies, player, target) # sneaky attack
  if rand(7) > player[:beers] # too many beers lower success

    if target[:item] # steal item
      target[:ganked], player[:item] = target[:item], target[:item]
      shout(target, :ganked)
      target[:item] = nil
    end
    if player[:weapon][:uses] == 1 && target[:weapon] # steal weapon and use it on final use
      target[:ganked], player[:weapon] = target[:weapon], target[:weapon]
      shout(target, :ganked)
      target[:weapon] = nil
    end
    player[:screen]   = { id: :flash, offset: 4, art: "#{BL}#{SNEAKY}#{CL}" }
    strike(enemies, player, target)
  else
    player[:screen]   = { id: :flash, offset: 4, art: "#{RD}#{LOSER}#{CL}" }
    shout(player, :wasted)
  end

  strike(enemies, target, player) if target[:hp].positive?
end

def rochambeau(enemies, player, target) # stylish attack
  shout(target, :style)
  player[:screen]  = { id: :bounce, art: "#{CN}#{WALK_OFF}#{CL}" } # sets the scene
  target[:moves] = []
  player[:moves] = []

  3.times do |round|
    break if player[:hp] <= 0 || target[:hp] <= 0
    target[:moves] << rand(5..7)
    choice = 0

    until (5..7).include?(choice)
      loop_menu(enemies, player, target, :style)
      choice = gets.chomp.to_i
      shout(target, :error) unless (5..7).include?(choice)
    end

    print `clear`
    player[:moves] << choice
    show_your_moves(player, target, :style)

    strike(enemies, player, target) if (choice > target[:moves][round]) || (choice == 5 && target[:moves][round] == 7) unless (target[:moves][round] == 5 && choice == 7)
    strike(enemies, target, player) if (target[:moves][round] > choice) || (target[:moves][round] == 5 && choice == 7) unless (choice == 5 && target[:moves][round] == 7)
    "#{shots_fired(player, target, :miss)} #{shots_fired(target, player, :miss)}" if choice == target[:moves][round]
  end
end

def coin_flip(enemies, player, target) # psychic attack
  player[:sight] = room_vault(2)
  player[:screen]   = { id: :flash, offset: 22, art: "#{MG}#{LETSGO}#{CL}" } # sets the scene
  shout(target, :psychic)

  loop do
    target[:move] = [5, 6].sample
    player[:choice] = 0

    until [5, 6].include?(player[:choice])
      loop_menu(enemies, player, target, :flip)
      player[:choice] = gets.chomp.to_i
      shout(target, :error) unless [5, 6].include?(player[:choice])
    end

    print `clear`
    show_your_moves(player, target, :flip)

    if player[:choice] == target[:move]
      player[:screen]   = { id: :flash, offset: 3, art: "#{MG}#{YOU_WIN.sample}#{CL}" }
      strike(enemies, player, target)
      break if target[:hp] <= 0
    else
      player[:screen] = { id: :flash, offset: 4, art: "#{RD}#{LOSER}#{CL}" }
      strike(enemies, target, player)
      break # Exit loop if choices don't match
    end
  end
end

def the_shop(player) # the shop appears randomly and will disappear next round
  if player[:shop] && player[:cash].positive?
    player[:gains] = rand(6..10) * player[:cash]
    crap_factory(player, :bonus) if player[:cash] > rand(5)
    weapon_wakes(player, player, (player[:cash] > rand(5) ? :bonus : nil))
    shout(player, :shop)
    player[:cash]   = 0
    player[:shop]   = false
    player[:screen] = { id: :flash, offset: 20, art: "#{GN}#{CASHED_OUT}#{CL}" }
  else shout(player, :error)
  end
end
