# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# possibly also sneak attack - steal enemy weapons
# possibly summon buddies

def brawl(enemies, player, target) # Regular brawl when player strikes
  strike(enemies, player, target)
  strike(enemies, target, player) if target[:hp].positive? && player[:hp].positive?
  surprise(enemies, player) unless enemies.empty? || player[:hp] <= 0 # random attack on player possible
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
  hunter, target = player[:flip] == 1 ? [ [player], enemies ] : [ enemies, [player] ]
  player[:roll].times { strike(enemies, hunter.sample, target.sample) unless enemies.empty? }
end

def rochambeau(enemies, player, target)
  shout(target, :combat)
  target[:moves] = []
  player[:moves] = []

  3.times do |round|
    break if player[:hp] <= 0 || target[:hp] <= 0
    target[:moves] << rand(5..7)
    choice = 0

    until (5..7).include?(choice)
      loop_menu(enemies, player, target, :style)
      choice = gets.chomp.to_i
      shout(target, :error) unless [5, 6].include?(choice)
    end

    print `clear`
    player[:moves] << choice
    show_your_moves(player, target, :style)

    strike(enemies, player, target) if (choice > target[:moves][round]) || (choice == 5 && target[:moves][round] == 7) unless (target[:moves][round] == 5 && choice == 7)
    strike(enemies, target, player) if (target[:moves][round] > choice) || (target[:moves][round] == 5 && choice == 7) unless (choice == 5 && target[:moves][round] == 7)
    "#{shots_fired(player, target, :miss)} #{shots_fired(target, player, :miss)}" if choice == target[:moves][round]
  end
end

def coin_flip(enemies, player, target)
  shout(target, :combat)

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
      strike(enemies, player, target)
      break if target[:hp] <= 0
    else
      strike(enemies, target, player)
      break # Exit loop if choices don't match
    end
  end
end
