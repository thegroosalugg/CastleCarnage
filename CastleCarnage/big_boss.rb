# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def big_boss_battle(player)
  print `clear`
  load_boss = big_boss_art
  the_boss = {
    hp: rand(800..1000), attack: (10..100).to_a, style: ["🍻 Barkeep"]
  }
  boss_style = the_boss[:style].sample
  game_info(player, the_boss, boss_style)

  while the_boss[:hp].positive? && player[:hp].positive?
    puts load_boss
    boss_menu

    user_choice = gets.chomp.to_i

    case user_choice
    when 4
      print `clear`
      boss_style = fight_the_power(player, the_boss, boss_style, load_boss)
    when 5
      print `clear`
      pay_with_blood(player)
    when 6
      break
    else
      error_message
    end

    game_info(player, the_boss, boss_style)
  end
end
