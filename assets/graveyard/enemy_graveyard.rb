# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

enemies.reject! do |enemy|
  if enemy[:hp] <= 0  # check for enemy deaths, update counter, track last enemy for game over
    player[:kills] += 1
    enemy_speaks(enemy, :pwned)
    player[:tracking] = enemy
    true  # This will remove the enemy from the array
  else
    false  # This will keep the enemy in the array
  end
end

enemies.each_with_index do |current_enemy, index| # check for enemy deaths, update counter, track last enemy for game over
  if current_enemy && current_enemy[:hp] <= 0
    enemies_defeated += 1
    enemy_speaks(current_enemy, :pwned)
    tracked_enemy = current_enemy
    enemies.delete_at(index) # Remove the defeated enemy from the array
  end
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
