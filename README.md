# DND
Creates a text-based DnD game through Bash scripting. The story will be updated over time to add more story.

- Will include a slightly simplified class system as opposed to the 5e rules at the start of implementation, but will later be updated to match the 5e classes better
- Levels will go 1-5 at the first iteration due to limited story. Later will be updated to 1-10, then 1-20. "DLC" versions will also be pushed for those that want to continue their journey along the way of updates. 
- I apologize in advance for the current lack of comments in the script. More comments will be added as the implementation grows, I wanted to just get something down that worked before going ham on 3 million comments

Known Issues:
- Due to lack of error checking, the ability score section allows the user to basically add ability points to whatever they want, even if it isn't on the list of abilities they can change.

Update (3/13/25)
- still deciding how to implement some of the spells/cantrips, so no updates for the past couple days. I've also been taking some time to learn Rust, so my time is split between a few things

Upcoming
- After finishing weapon choice section, I will be adding a function to allow the user to type 'character sheet' at any time during the game and see a visual of their character sheet with important details. I will then finish off the character creation and finally add more comments to the script + add enhanced error checking across the board for better case handling.

  Idea Board
  - implement a way to respec your character any time you're taking a long or short rest
  - implement long and short rests
  - implement a save feature so that players can save their progress in the game so that it doesn't restart every time
  - create a function that the user can call that returns a character sheet so that they can see their sheet
