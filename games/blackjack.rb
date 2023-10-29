# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def blackjack(enemies, player, dealer)
  loop do
    print `clear`
    set_the_scene(dealer, player)

    while player[:score] < 21
      loop_menu(enemies, player, dealer, :play)
      player[:choice] = gets.chomp.to_i

      if player[:choice] == 5
        print `clear`
        draw_card(player, player) # second argument required as player holds the deck, and dealer needs to access it
        shout(player, :cards)
      elsif player[:choice] == 6
        player[:stuck] = true
        break
      else shout(dealer, :error)
      end
    end

    print `clear`
    player[:land]   = { id: :flash, offset: 3, art: "#{GN}#{YOU_WIN.sample}#{CL}" } # sets the scene
    while dealer[:score] < 16 && !(player[:score] == 21 && player[:hand].length == 2)
      draw_card(dealer, player)
    end

    shout(dealer, :cards) unless player[:score] >= 21 || dealer[:hand].length < 3
    bust_or_break(enemies, dealer, player)
    break if player[:lost]

    loop do
      return if dealer[:hp] <= 0
      loop_menu(enemies, player, dealer, :replay)
      play_again = gets.chomp.to_i
      case play_again
      when 5 then break # play again
      when 6
        print `clear`
        shout(dealer, :goodbye)
        player[:land] = { id: :bounce, art: "#{GN}#{BATTLEFIELD.sample}#{CL}" } # reset art back to main menu
        return # exit game
      else shout(dealer, :error)
      end
    end
  end
end

def set_the_scene(dealer, player)
  player[:land]  = { id: :flash, offset: 22, art: "#{ML}#{CARD_FACES}#{CL}" } # change the scenery
  player[:stuck] = false
  player[:lost]  = false
  card_deck(player)
  dealer[:hand], player[:hand] = [], []

  [dealer[:hand], player[:hand]].each { |hand| 2.times { hand << player[:deck].shift } }
  dealer[:score], player[:score] = [dealer[:hand], player[:hand]].map { |hand| hand.sum { |card| card[:value] } }

  check_ace(player); check_ace(dealer)
  shout(dealer, :gamblore)
end

def card_deck(player)
  player[:deck] = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card suits
  royals = { "K" => 10, "Q" => 10, "J" => 10, "A" => 11 } # Define suit cards and their values
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |suit| # Add numbered cards to the deck
    values.each do |value|
      w = value == 10 ? "" : " " # <= creates a whitespace to even display between single & double digits
      card = ["♥️", "♦️"].include?(suit) ? { suit: "#{RD}#{w}#{value}#{suit}#{CL}", value: value } : { suit: "#{BL}#{w}#{value}#{suit}#{CL}", value: value }
      player[:deck] << card                # card = { suit: "#{w}#{value}#{suit}", value: value }
    end
  end
                                  # ^ original card code. I added a condition to color card name by suit
  suits.each do |suit| # Add suit cards to the deck
    royals.each do |name, value|
      card = ["♥️", "♦️"].include?(suit) ? { suit: "#{RD} #{name}#{suit}#{CL}", value: value } : { suit: "#{BL} #{name}#{suit}#{CL}", value: value }
      player[:deck] << card                # card = { suit: " #{name}#{suit}", value: value }
    end
  end

  player[:deck].shuffle! # Shuffle the player[:deck]
end

def check_ace(player)
  if player[:hand].last[:value] == 11 && player[:score] > 21
    player[:hand].last[:value] = 1
    player[:score] -= 10
  end
end

def draw_card(player, deck) # deck is stored in player, +1 parameter must also exist for the dealer to draw
  card_deck(deck) if deck[:deck].empty?
  player[:hand] << deck[:deck].shift
  player[:score] = player[:hand].sum { |card| card[:value] }
  check_ace(player)
end

def bust_or_break(enemies, dealer, player)
  shout(player, :cards) unless player[:hand].length < 3 || player[:choice] == 6
  whos_the_winner(dealer, player)
  if player[:score] <= 21 && (player[:score] > dealer[:score] || dealer[:score] > 21) # Who's the winner
    player[:cash] = (player[:cash] + 1).clamp(0, 5)
    n = player[:score] == 21 && player[:hand].length == 2 ? 2 : 1
    n.times { break if dealer[:hp] <= 0; strike(enemies, player, dealer) } # blackjack gives 2 strikes, unless 1st strike deals lethal
  else
    # whos_the_winner(dealer, player) # end of game message
    strike(enemies, dealer, player)  # player struck
    player[:stuck] = true if dealer[:score] == 21 # dealer only reveals hand if they get 21 if they didn't draw
    whos_holding_what(dealer, player) # display showed here as above must run first in that order
    player[:land] = { id: :flash, offset: 4, art: "#{RD}#{LOSER}#{CL}" }
    player[:lost] = true
  end
end
