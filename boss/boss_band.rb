# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def mosh_pit(the_boss, boss_style, player, cash_lost) # damage reduced by cash lost, multiplier incresed by drunkenness
  damage = ((player[:attack].sample - cash_lost * rand(2.0..3.5)) * (1.0 + player[:drunk] * 0.1)).to_i.clamp(0, 100)
  the_boss[:hp] -= damage
  invoice(player, player[:drunk], :pit)
  succesful_hit(player, the_boss, damage)
end

def fight_the_band(player, weapon, the_boss, boss_style, load_boss)
  user_choice = 0
  style_intro(the_boss, boss_style)

  until [4, 5].include?(user_choice)
    game_info(player, weapon, the_boss, boss_style, load_boss)
    fight_menu(player, boss_style, weapon)

    user_choice = gets.chomp.to_i
    if user_choice == 4
      print `clear`                                                        # band boss always strikes first
      cash_lost = boss_strikes_back(the_boss, boss_style, player, weapon)  # player damage decreased by cash lost and increased by drunkenness
      mosh_pit(the_boss, boss_style, player, cash_lost)
    elsif user_choice == 5
      print `clear`
      boss_strikes_back(the_boss, boss_style, player, weapon)
    else
      error_message
    end
  end

  boss_style = the_boss[:style].sample
  style_outro(the_boss, boss_style) if the_boss[:hp].positive?
  return boss_style
end
