# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def bonus(player, rooms_explored, enemies_defeated)
  health = 100 + (rooms_explored * 20)
  boost = [:attack, :block].sample
  multiplier = enemies_defeated * rand(1..3)
  player[:hp] += health
  player[boost] = player[boost].map { |stat| stat + multiplier }
  your_rewards(player, health, boost, multiplier)
end

def big_boss_battle(player, weapon, the_boss)
  load_boss = big_boss_art
  boss_style = the_boss[:style].sample
  game_info(player, weapon, the_boss, boss_style, load_boss)

  while the_boss[:hp].positive? && player[:hp].positive?
    boss_menu

    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      print `clear`
      power_drained = false
      boss_style = fight_the_power(player, weapon, the_boss, boss_style, load_boss)
    when 5
      print `clear`
      power_drained == true ? drained_message : boss_style = pay_with_blood(player, weapon, the_boss, boss_style, load_boss)
      power_drained = true
    when 6
      print `clear`
      the_boss[:hp] -= 200 # Debug
    when 7
      print `clear`
      player[:hp] -= 300 # Debug
    else
      error_message
    end

    game_info(player, weapon, the_boss, boss_style, load_boss)
  end
end
