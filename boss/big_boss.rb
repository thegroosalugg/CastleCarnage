# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def bonus(player)
  health = player[:rooms] * 30
  boost = [:attack, :block].sample
  multiplier = player[:kills] * rand(1..2)
  player[:hp] = [player[:hp] + health, 500].min
  player[boost] = (player[boost].min + multiplier)..(player[boost].max + multiplier)
  your_rewards(player, health, boost, multiplier)
end

def big_boss_battle(player, weapon, the_boss)
  player[:turns] = 0
  buddy = nil
  load_boss = big_boss_art
  boss_style = the_boss[:style].sample
  game_info(player, buddy, weapon, the_boss, boss_style, load_boss)

  while the_boss[:hp].positive? && player[:hp].positive?
    boss_menu(player, boss_style)

    user_choice = gets.chomp.downcase

    # DEBUG CHEAT MENU
    buddy, weapon, boss_style = cheat_menu_boss(user_choice, player, buddy, weapon, the_boss, boss_style)

    if user_choice == "t"
      print `clear`
      player[:drained] = false
      player[:turns] = (player[:turns] + 1).clamp(0, 4)
      case boss_style
      when "🍻 Barkeep" then boss_style = fight_the_barkeep(player, buddy, weapon, the_boss, boss_style, load_boss)
      when "🕶️ Bouncer" then boss_style, weapon = fight_the_bouncer(player, buddy, weapon, the_boss, boss_style, load_boss)
      when "🎶 Band"    then boss_style = fight_the_band(player, buddy, weapon, the_boss, boss_style, load_boss)
      end
    elsif user_choice == "r"
      unless player[:drained]
        print `clear`
        the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
        boss_style = pay_with_blood(player, buddy, weapon, the_boss, boss_style, load_boss)
        player[:drained] = true
      else
        drained
      end
    elsif user_choice == "y"
      if player[:turns] == 4
        buddy = random_enemy
        enemy_speaks(buddy, :revive)
        player[:turns] = 0
        player[:hp] -= buddy[:hp] / 2
        the_boss[:rage] = (the_boss[:rage] + 1).clamp(0, 10)
        invoice(player, (buddy[:hp] / 2), :grave)
      else
        error_message
      end
    else
      error_message
    end

    boss_rage(player, buddy, the_boss) if user_choice == "t" && the_boss[:hp].positive?
    if buddy && buddy[:hp] <= 0
      enemy_speaks(buddy, :pwned)
      buddy = nil
    end
    game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
  end
end
