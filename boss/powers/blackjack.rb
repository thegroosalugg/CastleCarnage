# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def deck
  deck = []
  suits = ["♠️", "♥️", "♦️", "♣️"] # Define an array of emojis representing card faces
  royals = { "Ķ" => 10, "ʠ" => 10, "J" => 10, "Ā" => "11" } # Define face cards and their values (e.g., King, Queen, Jack)
  values = (2..10).to_a # Define card values for numbered cards (2 to 10)

  suits.each do |face| # Add numbered cards to the deck
    values.each do |value|
      card = { face: "#{face} #{value}", value: value }
      deck << card
    end
  end

  suits.each do |face| # Add face cards to the deck
    royals.each do |name, value|
      card = { face: "#{face} #{name}", value: value }
      deck << card
    end
  end

  deck.shuffle! # Shuffle the deck

  deck.each do |card| # Print the deck
    puts "#{card[:face]} (Value: #{card[:value]})"
  end
end

def blackjack(player)
  puts "♣️♦️♥️♠️👑🫅🤴👸"
end
