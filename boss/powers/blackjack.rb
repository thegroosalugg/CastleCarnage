# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Find the messagess in combat/messages/war_letters.rb

def card_deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card suits
  royals = { "K" => 10, "Q" => 10, "J" => 10, "A" => 11 } # Define suit cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |suit| # Add numbered cards to the deck
    values.each do |value|
      card = { suit: "#{value}#{suit}", value: value }
      deck << card
    end
  end

  suits.each do |suit| # Add suit cards to the deck
    royals.each do |name, value|
      card = { suit: "#{name}#{suit}", value: value }
      deck << card
    end
  end

  deck.shuffle! # Shuffle the deck
end

def check_ace(hand, total)
  if hand.last[:value] == 11 && total > 21
    hand.last[:value] = 1
    total -= 10
  end
  [hand, total]
end

def blackjack(player, weapon, the_boss, boss_style, load_boss)
  loop do
    print `clear`
    greeting

    player[:cash] -= 1
    player[:stuck] = false
    deck = card_deck
    boss_hand, your_hand = [], []

    [boss_hand, your_hand].each { |hand| 2.times { hand << deck.shift } }
    boss_total, your_total = [boss_hand, your_hand].map { |hand| hand.sum { |card| card[:value] } }

    your_hand, your_total = check_ace(your_hand, your_total)
    boss_hand, boss_total = check_ace(boss_hand, boss_total)
    whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)

    while your_total < 21
      deck = card_deck if deck.empty?
      game_info(player, weapon, the_boss, boss_style, load_boss)
      step_on_up(:cards)
      user_action = gets.chomp

      if user_action == "4"
        print `clear`
        your_hand << deck.shift
        your_total = your_hand.sum { |card| card[:value] }
        your_hand, your_total = check_ace(your_hand, your_total)
        whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
      elsif user_action == "5"
        player[:stuck] = true
        break
      else
        error_message
        whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
      end
    end

    while boss_total < 16
      boss_hand << deck.shift
      boss_total = boss_hand.sum { |card| card[:value] }
      boss_hand, boss_total = check_ace(boss_hand, boss_total)
    end

    print `clear`

    if your_total <= 21 && (your_total > boss_total || boss_total > 21) # Who's the winner
      puts "You win!"
      player[:cash] = (player[:cash] + 3).clamp(0, 20)
    else
      puts "You lose!"
      player[:stuck] = true if boss_total == 21
      whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
      break # Game ends if you lose
    end

    loop do
      whos_holding_what(player, boss_hand, boss_total, your_hand, your_total)
      game_info(player, weapon, the_boss, boss_style, load_boss)
      puts "Press [Y] to play again or [N] to quit"
      play_again = gets.chomp.downcase
      case play_again
      when 'y'
        break
      when 'n'
        print `clear`
        return
      else
        error_message
      end
    end
  end
end
