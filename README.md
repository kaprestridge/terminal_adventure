# Terminal Adventure
##Goosey Business, T1A3


## Statement of Purpose
This application is a text-based adventure in the style of classic games such as Colossal Cave Adventure. It is run within the terminal. The user will be able to create and change their character before they begin, and this will impact how the story plays out.
The application will receive user input and store it in a 'hero' class.  This will then be used through the application. The user will go through the story and do a series of puzzles and tasks in order to 'win' the game.
The target audience is Coder Academy instructors and peers, as well as potential future employers. It will be suitable for all ages.
The user will download the code from github and install gems via bundler. They will then be able to run the application in their terminal.


## MVP Features
- A character creator section: This will enable the user to customise their experience through the story by giving their character a name and setting their stats based on answers to a personality quiz. This will also encourage replays through the different paths available.
- Help menu: A menu outlining how the game works and how to use the application
- A branching story with at least 3 possible outcomes: A story that unfolds as the user moves through it, with interesting paths that change based on the users choices as well and their character stats which they set at the beginning of the game.
- Error handling: Helpful and detailed feedback for users when they select or enter something incorrectly

## If time/future Features
- More than 3 outcomes: More story options and outcomes based on the users chocies
- Art for every page: Art to make the game look and feel more 'finished' for the user
- Ability to save: A way to save the users character as well as the page they are up to in the story so they can select continue from the main menu.\

## Outline of User Experience
When the app is launched they will be shown an opening page with the game title, and a list of options. These will be New Game, Help and Exit.
The user will be required to select each option via the use of TTY prompt. When they select an option they will be directed to the relevant section.
The user will enter a name for their hero, which must be between 1 and 10 characters in length. Error handling here will return an error if the name does not fit these parameters. It will then ask the user to resubit a name until the string is between 1 and 10 characters in length.
The user will then make their character via TTY prompt answers, and be shown their character's stats.
Afterwards they will navigate the story again via TTY-Prompt.
At the end (win or lose) They will be sent back to the main menu.

## App flowchart
The following high-level flow chart shows how the user can move from the welcome screen to other parts of the app. The game itself has many branching parts.

![alt text](docs/t1a3_flow.png "Flow chart for app overview")


## Project Management
Trello board:

![alt text](docs/trello_board.png "Initial trello board")


## How to run Goosey Business
### Requirements
- Ruby 2.7.2 ([Download here](https://www.ruby-lang.org/en/downloads/))
- MacOS or Linux
### How to install
- Clone the repo [here](https://github.com/kaprestridge/terminal_adventure)
- Open the ./scr directory
- Run `bash goose_install.sh` or `zsh goose_install.sh` to install and run
- After installing to run use `bash goose.sh` or `zsh goose.sh`