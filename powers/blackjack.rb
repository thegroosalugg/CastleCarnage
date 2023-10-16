# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def card_deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card suits
  royals = { "K" => 10, "Q" => 10, "J" => 10, "A" => 11 } # Define suit cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |suit| # Add numbered cards to the deck
    values.each do |value|
      w = value == 10 ? "" : " " # <= creates a whitespace to even display between single & double digits
      card = ["♥️", "♦️"].include?(suit) ? { suit: "#{RD}#{w}#{value}#{suit}#{CL}", value: value } : { suit: "#{BL}#{w}#{value}#{suit}#{CL}", value: value }
      deck << card                # card = { suit: "#{w}#{value}#{suit}", value: value }
    end
  end
                                  # ^ original card code. I added a condition to color card name by suit
  suits.each do |suit| # Add suit cards to the deck
    royals.each do |name, value|
      card = ["♥️", "♦️"].include?(suit) ? { suit: "#{RD} #{name}#{suit}#{CL}", value: value } : { suit: "#{BL} #{name}#{suit}#{CL}", value: value }
      deck << card                # card = { suit: " #{name}#{suit}", value: value }
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

def blackjack(player, buddy, weapon, the_boss, boss_style, load_boss)
  loop do
    print `clear`

    player[:cash] -= 1
    player[:stuck] = false
    invoice(player, 1, :loss)
    greeting(:combat)
    deck = card_deck
    boss_hand, your_hand = [], []

    [boss_hand, your_hand].each { |hand| 2.times { hand << deck.shift } }
    boss_total, your_total = [boss_hand, your_hand].map { |hand| hand.sum { |card| card[:value] } }

    your_hand, your_total = check_ace(your_hand, your_total)
    boss_hand, boss_total = check_ace(boss_hand, boss_total)
    whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)

    while your_total < 21
      deck = card_deck if deck.empty?
      game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
      game_menu(:cards)
      choice = gets.chomp.to_i

      if choice == 4
        print `clear`
        your_hand << deck.shift
        your_total = your_hand.sum { |card| card[:value] }
        your_hand, your_total = check_ace(your_hand, your_total)
        invoice(player, your_hand, :cards)
        whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
      elsif choice == 5
        player[:stuck] = true
        break
      else
        error(:input)
        whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
      end
    end

    while boss_total < 16
      boss_hand << deck.shift
      boss_total = boss_hand.sum { |card| card[:value] }
      boss_hand, boss_total = check_ace(boss_hand, boss_total)
    end

    print `clear`
    invoice(the_boss, boss_hand, :cards) unless your_total >= 21 || boss_hand.length < 3

    if your_total <= 21 && (your_total > boss_total || boss_total > 21) # Who's the winner
      whos_the_boss(your_hand, your_total, boss_total)
      player[:cash] = (player[:cash] + 3).clamp(0, 20)
      invoice(player, 3, :cash)
    else
      invoice(player, your_hand, :cards) unless your_hand.length < 3 || choice == 5
      whos_the_boss(your_hand, your_total, boss_total)
      player[:stuck] = true if boss_total == 21
      whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
      break # Game ends if you lose
    end

    loop do
      whos_holding_what(player, the_boss, boss_hand, boss_total, your_hand, your_total)
      game_info(player, buddy, weapon, the_boss, boss_style, load_boss)
      game_menu(:again)
      play_again = gets.chomp.to_i
      case play_again
      when 4
        break
      when 5
        print `clear`
        return
      else
        error(play_again, :input)
      end
    end
  end
end
