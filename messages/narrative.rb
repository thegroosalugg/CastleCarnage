# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# END OF GAME MESSAGES

def game_over(player)
  win = [
    "You blasted #{player[:tracking][:name]} to another dimension. Your power level has increased.",
    "#{player[:tracking][:name]} had a sudden heart attack, you win by default.",
    "You splatted #{player[:tracking][:name]} like a grape.",
  ]
  lose = [
    "You stacked it and fell on a spike. #{player[:tracking][:name]} laughs at your misfortune.",
    "#{player[:tracking][:name]} ripped your head off. You won't be coming home for dinner.",
    "You Died! #{player[:tracking][:name]} shall feast on your entrails.",
  ]

  puts text_break((player[:hp].positive? ? win : lose).sample, " ", 80)
  puts BARRIER
  player[:hp].positive? ? win_art : lose_art
  puts BARRIER
  play_again
end
