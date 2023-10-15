# rubocop:disable all
#-----------------------------YOUR CODE BELOW---------------------------------->

def battlefield
  art = [
    # ASCII art 1
    <<-'ASCII',

      |_O            O_\
        |`-)--- ---(-'\
        |\           / |
       /  |          |  \
    ASCII
    # ASCII art 2
    <<-'ASCII',
             X
      |_O   / \  O_\
        |`-/   \-'\
        |\       / |
       /  |      |  \
    ASCII
    # ASCII art 3
    <<-'ASCII',
           \ /
      |_O   X  O_\
        |`-/ \-'\
        |\     / |
       /  |    |  \
    ASCII
    # ASCII art 4
    <<-'ASCII',
           \ /
       |_O  X  O_\
        /`-/ \-'\
       | \     / |
      /   \    |  \
    ASCII
    # ASCII art 5
    <<-'ASCII',
             /
       /_O  X
        /`-/ \   O_\
       | \    \-'_\
      /  /       \ |_
    ASCII
     # ASCII art 6
    <<-'ASCII',
       /_O  X
        /`-/ \  O_\
       | \    \-'\
      /  /      / |
                |  \
    ASCII
    # ASCII art 7
    <<-'ASCII',
   \C        \
 _ /`--|)---- \_ O__/
 \`\          `\/_\
`` /_            \\
                 ` \
    ASCII
  ]

  battle = { id: :move, art: art.sample }
end
