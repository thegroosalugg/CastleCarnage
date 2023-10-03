# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def fight_the_toilet(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  style_intro(the_boss, boss_style)

  until [4, 5].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    if user_choice == 4
      print `clear`
      pay_the_tab(player, the_boss)
    elsif user_choice == 5
      print `clear`
      bar_fight(player, the_boss)
    else
      error_message
    end
  end

  boss_style = the_boss[:style].sample
end
