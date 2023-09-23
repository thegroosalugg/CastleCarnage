# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def big_boss_battle(player)
  print `clear`
  load_boss = big_boss_art
  the_boss = {
    hp: rand(500..600), attack: (10..100).to_a, block: (3..20).to_a, crit_ch: (1..9).to_a, crit_x: -> { rand(1.5..3.0) }, accuracy: (1..8).to_a,
    style: ["🍻 Barkeep"]
  }
  boss_style = the_boss[:style].sample
  game_info(player, the_boss, boss_style)

  while the_boss[:hp].positive? && player[:hp].positive?
    puts load_boss
    boss_menu

    user_decision = gets.chomp.to_i

    case user_decision
    when 4
      boss_style = fight_the_power(player, the_boss, boss_style)
    when 5
      pay_with_blood(player)
    when 6
      break
    else
      error_message
    end

    game_info(player, the_boss, boss_style)
  end
end
