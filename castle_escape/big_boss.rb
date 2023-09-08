def big_boss_battle(player)
  the_boss = {
    hp: rand(500..600),
    attack: (10..100).to_a,
    block: (3..20).to_a,
    crit_ch: (1..9).to_a,
    crit_x: -> { rand(1.5..3.0) },
    accuracy: (1..8).to_a
  }

  while the_boss[:hp] > 0 && player[:hp] > 0
    print `clear`
    big_boss
    puts "BOSS: #{the_boss[:hp]} || YOU: #{player[:hp]}"
    user_decision = gets.chomp.to_i

    break if user_decision == 5
  end
end
