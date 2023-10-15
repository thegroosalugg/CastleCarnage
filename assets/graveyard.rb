# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

# Original Text Break Generator worked until ANSI & ASCII code was introduced to text

def text_break(message, char, size)
  words = message.split
  lines = []
  current_line = []

  words.each do |word|
    if current_line.join(' ').length + word.length + 1 <= size
      current_line << word
    else
      lines << current_line.join(' ')
      current_line = [word]
    end
  end

  lines << current_line.join(' ') unless current_line.empty?
  lines.map { |line| padding_generator(line, char, size) }
end
