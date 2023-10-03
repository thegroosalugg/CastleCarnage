# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_band(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  style_intro(the_boss, boss_style)

  until [4, 5].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    if user_choice == 4
      print `clear`
    elsif user_choice == 5
      print `clear`
    else
      error_message
    end
  end

  boss_style = the_boss[:style].sample
  style_outro(the_boss, boss_style)
  return boss_style
end
