# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def bonus(player, rooms_explored, enemies_defeated)
  health = 100 + (rooms_explored * 25)
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
    boss_menu(boss_style)

    user_choice = gets.chomp.downcase

    # DEBUG CHEAT MENU
    weapon, boss_style = cheat_menu_boss(user_choice, player, weapon, the_boss, boss_style)

    if user_choice == "t"
      print `clear`
      power_drained = false
      case boss_style
      when "🍻 Barkeep" then boss_style = fight_the_barkeep(player, weapon, the_boss, boss_style, load_boss)
      when "🕶️ Bouncer" then boss_style, weapon = fight_the_bouncer(player, weapon, the_boss, boss_style, load_boss)
      when "🎶 Band"    then boss_style = fight_the_band(player, weapon, the_boss, boss_style, load_boss)
      end
    elsif user_choice == "r"
      print `clear`
      power_drained ? drained_message : boss_style = pay_with_blood(player, weapon, the_boss, boss_style, load_boss)
      power_drained = true
    else
      error_message
    end

    game_info(player, weapon, the_boss, boss_style, load_boss)
  end
end
