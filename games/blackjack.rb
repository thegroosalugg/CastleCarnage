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

def check_ace(player)
  if player[:hand].last[:value] == 11 && player[:score] > 21
    player[:hand].last[:value] = 1
    player[:score] -= 10
  end
end

def draw_card(player, deck)
  player[:hand] << deck.shift
  player[:score] = player[:hand].sum { |card| card[:value] }
  check_ace(player)
end

def blackjack(enemies, player, dealer)
  loop do
    print `clear`

    player[:land] = BARKEEP # change the scenery
    player[:stuck] = false
    deck = card_deck
    dealer[:hand], player[:hand] = [], []

    [dealer[:hand], player[:hand]].each { |hand| 2.times { hand << deck.shift } }
    dealer[:score], player[:score] = [dealer[:hand], player[:hand]].map { |hand| hand.sum { |card| card[:value] } }

    check_ace(player); check_ace(dealer)
    shout(dealer, :gamblore)

    while player[:score] < 21
      deck = card_deck if deck.empty?
      whos_holding_what(dealer, player)
      game_info(enemies, player)
      load_menu(player, :cards)
      choice = gets.chomp.to_i

      if choice == 4
        print `clear`
        draw_card(player, deck)
        shout(player, :cards)
      elsif choice == 5
        player[:stuck] = true
        break
      else
        shout(dealer, :error)
      end
    end

    print `clear`
    while dealer[:score] < 16 && !(player[:score] == 21 && player[:hand].length == 2)
      draw_card(dealer, deck)
    end
    shout(dealer, :cards) unless player[:score] >= 21 || dealer[:hand].length < 3

    if player[:score] <= 21 && (player[:score] > dealer[:score] || dealer[:score] > 21) # Who's the winner
      whos_the_winner(dealer, player)
      n = player[:score] == 21 && player[:hand].length == 2 ? 2 : 1
      n.times { strike(enemies, player, dealer) }
    else
      shout(player, :cards) unless player[:hand].length < 3 || choice == 5
      whos_the_winner(dealer, player)
      strike(enemies, dealer, player)
      player[:stuck] = true if dealer[:score] == 21
      whos_holding_what(dealer, player)
      player[:land] = { id: :move, art: BATTLEFIELD.sample }
      break # Game ends if you lose
    end

    loop do
      return if dealer[:hp] <= 0
      whos_holding_what(dealer, player)
      game_info(enemies, player)
      load_menu(player, :again)
      play_again = gets.chomp.to_i
      case play_again
      when 4
        break
      when 5
        print `clear`
        shout(dealer, :goodbye)
        player[:land] = { id: :move, art: BATTLEFIELD.sample }
        return
      else
        shout(dealer, :error)
      end
    end
  end
end
