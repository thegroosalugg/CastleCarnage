# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def big_boss_battle(player)
  load_boss = big_boss_art
  the_boss = {
    hp: rand(800..1000), attack: (10..100).to_a, style: ["🍻 Barkeep"]
  }
  boss_style = the_boss[:style].sample
  game_info(player, the_boss, boss_style, load_boss)

  while the_boss[:hp].positive? && player[:hp].positive?
    boss_menu

    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      print `clear`
      power_drained = false
      boss_style = fight_the_power(player, the_boss, boss_style, load_boss)
    when 5
      print `clear`
      power_drained == true ? error_message : boss_style = pay_with_blood(player, the_boss, boss_style, load_boss)
      power_drained = true
    when 6
      break
    else
      error_message
    end

    game_info(player, the_boss, boss_style, load_boss)
  end
end
