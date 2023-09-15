# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->


def big_boss_battle(player)
  selected_boss = big_boss_display
  the_boss = {
    hp: rand(500..600),
    attack: (10..100).to_a,
    block: (3..20).to_a,
    crit_ch: (1..9).to_a,
    crit_x: -> { rand(1.5..3.0) },
    accuracy: (1..8).to_a
  }

  while the_boss[:hp].positive? && player[:hp].positive?
    print `clear`
    puts selected_boss
    puts "BOSS: #{the_boss[:hp].to_i} || YOU: #{player[:hp].to_i}"
    user_decision = gets.chomp.to_i

    player[:hp] -= 100 if user_decision == 4
    break if user_decision == 5
  end
end
