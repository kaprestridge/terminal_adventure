require "tty-prompt"
prompt = TTY::Prompt.new
require "colorize"
require "json"
require_relative "character_creator.rb"


def welcome_screen (prompt)
    system ('clear')
    puts'
     _______  _______  _______     _______. _______    ____    __    ____  ___      .______      
    /  _____||   ____||   ____|   /       ||   ____|   \   \  /  \  /   / /   \     |   _  \     
   |  |  __  |  |__   |  |__     |   (----`|  |__       \   \/    \/   / /  ^  \    |  |_)  |    
   |  | |_ | |   __|  |   __|     \   \    |   __|       \            / /  /_\  \   |      /     
   |  |__| | |  |____ |  |____.----)   |   |  |____       \    /\    / /  _____  \  |  |\  \----.
    \______| |_______||_______|_______/    |_______|       \__/  \__/ /__/     \__\ | _| `._____|
    
    
    '.cyan

    puts 'Welcome to Geese, a text based adventure game right here in your terminal'
    

        menu_options = [
            {name: "New Game", value: 1},
            {name: "Continue", value: 2},
            {name: "Help", value: 3},
            {name: "Exit", value:4}
        ]
        chosen_option = prompt.select("What would you like to do?", menu_options)

if chosen_option == 1
p
elsif chosen_option == 2
puts "There is no save file system yet sorry, press return to continue"
gets
welcome_screen(prompt)
elsif chosen_option == 3
    system('clear')
    puts "This is the help screen"
    puts 'press return to go back to the main menu'
    gets
    welcome_screen(prompt)
elsif chosen_option == 4
    puts 'goodbye'
    exit(0)
else
    welcome_screen(prompt)
end

end

welcome_screen(prompt)
puts "What is your name?"
hero_name = gets.chomp.to_s.capitalize
hero = Hero.new(hero_name)
system('clear')
# puts "Welcome #{hero_name}"
# puts "
# hero strength: #{hero.str}
# hero dexterity: #{hero.dex}
# hero constitution: #{hero.con}
# hero intelligence: #{hero.int}
# hero wisdom: #{hero.wis}"

question_list = [
    question1 = Hero_Questions.new(
        "What is your favorite colour?",
        answer_options1 = {"Red" => proc { hero.change_str(1)}, "Blue" => proc { hero.change_dex(1)}, "Green" => proc { hero.change_cha(1)}, "Yellow" => proc { hero.change_wis(1)}, "Pink" => proc { hero.change_int(1)} }
    ),
    question2 = Hero_Questions.new(
        "You come face-to-face with your worst enemy, how do you react?",
        answer_options2 = {"Challenge them to a fight" => proc { hero.change_str(2)}, "Slip behind the nearest cover and hope they didn't see you" => proc { hero.change_dex(2)}, "Walk the other way" => proc { hero.change_int(2)}, "I don't have enemies, everyone loves me" => proc { hero.change_cha(2)} }
    ),
    question3 = Hero_Questions.new(
        "Are you a morning person?",
        answer_options3 = {"Yes, the early bird gets the worm" => proc { hero.change_int(2)}, "I'm more of a night-owl" => proc { hero.change_wis(2 )}, "I never sleep" => proc { hero.change_str(2)}, "I just nap constantly" => proc { hero.change_wis(2)} }
    ),
    question4 = Hero_Questions.new(
        "Do you prefer cats or dogs?",
        answer_options4 = {"I like them both equally" => proc { hero.change_wis(1)}, "Cats, of course" => proc { hero.change_dex(1)}, "Dogs are superior" => proc { hero.change_cha(1)}, "Both are useless" => proc {hero.change_str(1)}, "I prefer lizards" => proc {hero.change_int(2)} }
    ),
    question5 = Hero_Questions.new(
        "Do you like being the center of attention?",
        answer_options4 = {"Always!" => proc { hero.change_cha(2)}, "I prefer to stay in the shadows" => proc { hero.change_dex(2)}, "Only around close friends" => proc { hero.change_int(2)}, "If I can show off my muscles" => proc { hero.change_str(2)} }
    ),
    question6 = Hero_Questions.new(
        "What do you do to feel better when you’re sad?",
        answer_options4 = {"Start a fight" => proc { hero.change_str(1)}, "Talk to a friend" => proc { hero.change_wis(1)}, "Listen to music" => proc { hero.change_cha(1)}, "Drink" => proc { hero.change_int(1)} }
    ),
    question7 = Hero_Questions.new(
        "As a kid, what did you want to be when you grew up?",
        answer_options4 = {"An actor" => proc { hero.change_cha(1)}, "A baker" => proc { hero.change_dex(1)}, "A scholar" => proc { hero.change_int(1)}, "A politician" => proc { hero.change_int(1)} }
    ),
    question8 = Hero_Questions.new(
        "Do you admit to mistakes when you make them?",
        answer_options4 = {"I would but I never make mistakes" => proc { hero.change_str(1)}, "Always, it is the best way to learn" => proc { hero.change_wis(1)}, "Only if I'm forced to" => proc { hero.change_cha(1)} }
    ),
    
    ]



    question_list.each { |q| 
        system ('clear')
        puts'
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░███░░░░░░░░░███░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████░░░░░░░███░
        ╔══╗░░░░░░░░░░░░░░╔╗░░░░╔╗░░░░░░██▒█████░░░░░░░█░░
        ╚╗╔╩╦╗╔╗░╔══╦═╗╔═╗║╚╦═╦╦╣╚╗░░░███▒████████░░░░░█░░
        ░║║╩╣╚╣╚╗║║║║╩╣║╬╚╣╬║╬║║║╔╣██████████████████░░█░░
        ░╚╩═╩═╩═╝╚╩╩╩═╝╚══╩═╩═╩═╩═╝░░░██░░░░░░░██░░░░░░█░░
        ░░░░░░░░░╔═╗░░░╔═╗░░░░░░░░░░░░██░░█░█░░██░░░░░░█░░
        ░╔╦╦═╦╦╦╦╣═╬═╦╗║═╣░░░░░░░░░░░░░██░░░░░██░░░░░░██░░
        ░║║║╬║║║╔╬═║╩╣╚╣╔╬╦╗░░░░░░░░░░░░███████░░░░░██░█░░
        ░╠╗╠═╩═╩╝╚═╩═╩═╩╩╩╩╝░░░░░░░░░░░░░░░██░░░░░███░░█░░
        ░╚═╝░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░░█░░░░█░░
        '
        puts q
        menu_options = q.answer_options.map{|option, index| {name: option, value: index} }
        hero_answer = prompt.select('Your answer:', menu_options)
        }

            system ('clear')
            puts "Welcome #{hero_name}"
            puts 'Based on your answers your character has the following stats'
            puts "Strength: #{hero.str}
Dexterity: #{hero.dex}
Constitution: #{hero.con}
Intelligence: #{hero.int}
Wisdom: #{hero.wis}".cyan
            puts "In order to complete the game there will be times where your skills will be tested,
if your heros stats are lower than that of the required option you will be unable to proceed
down that path. You will then need to select a different option. Test your skills and try to
unravel the mystery and complete the game"
            puts "Press Return to begin your adventure"
            gets

            
        
        class Page
            attr_reader :story, :symbol ,:options, :option_text
            def initialize(story, options, option_text, symbol)
                @story = story
                @options = options[0..]
                @symbol = symbol
                @option_text = option_text[0..]
            end
            def to_s
                'page'
            end
        end

        
        last_page = Page.new(
            " ",
            [0],
            [" "],
            :last_page
        )
        page16 = Page.new(
            "
‘Now the way I see-s it, the most likely culprit for this predicament is 
Istval, the Fae. She lives on the outskirts of the forest, a few hours 
north of here in a tower. She likes causing trouble and the townsfolk 
never really liked her being there so would often try to drive her away. 
This seems like a prank she would enjoy… Otherwise we could try to find the 
answer here in the books, it looks messy but I know there has to be a solution 
in here somewhere’",
            [last_page, last_page],
            ["Let's go find Istval", "Find the solution in the library"],
            :page16
        )

        page15 = Page.new(
            "
‘My name is George, George Gipps, at your service!’ he replied, 
bobbing his head in what you assume must be the goose-equivalent 
of a bow ‘But no time for that! That was the only copy of that spell 
I own and the clock is ticking! I need your help. I’ve no idea how 
but last night I went to bed a gnome, and this morning I seem to have 
woken up… well… like this’ He spread his wings wide, and looked at himself.
‘Now, I don’t know what caused this but since you are the only 
one I can see with thumbs, I am going to need your assistance’.",
            [page16],
            ["Continue"],
            :page15
        )

        page14 = Page.new(
            "
You read the spell, careful not to miss anything in case it goes wrong. 
You finish and… nothing feels different. You look down at the goose, 
who looks exactly the same. You must have done something wrong…
‘Did it work?’ You jump at the sound of the voice coming from at your feet. Looks like it worked!",
            [page15],
            ["Ask who he is"],
            :page14
        )

        page13 = Page.new(
            "
You take the page from the bird, who stares at you with beady eyes. 
You read the title ‘Speak with animals’! You know a little bit about 
spells from travelling adventurers you’ve met. If you read this correctly 
you should be able to speak with any creatures around you, but only for 
a short time. You look back at the goose, their eyes seem more intelligent 
than the geese you’ve met in the past… Maybe you should give it a shot.",
            [page14],
            ["Read the spell"],
            :page13
        )

        page12 = Page.new(
            "
You back out of the room slowly, the now angry goose following 
you with the paper still held towards you. It honks angrily and 
rushes at your legs, wings flapping, knocking you to the floor. 
The fowl jumps on your chest, the title of the paper now in line 
with your eyes… It is a page from a spellbook!",
            [page13],
            ["Take the page"],
            :page12
        )

        page11 = Page.new(
            "
CRASH!!!, you feel something hit the back of your head. 
A flurry of white feathers and panicked honking begins as yet 
another goose rushes past you and into the room. Frantically it 
begins flapping around the room as if… searching for something? 
You watch as it knocks over piles of books and papers, steps in 
an opened vial of ink and proceeds to put webbed prints all over 
the room. Grasping a piece of paper in its beak it rushes back 
to you and stretches out its neck… offering it to you?",
            [page13, page12],
            ["Take the paper", "Ignore the bird and leave the room"],
            :page11
        )

        page10 = Page.new(
            "
You head to the building the girl called the library, though it may have 
been generous to call it that. The tiny building was only one room and in 
a state of disrepair. You push the door open and enter the dusty room. 
The walls were lined with shelves and selves of dusty tomes, books littered in 
piles and covering every flat surface of the room aside from a small bed 
pushed into one corner.
‘Hello?’ You call out into the dim room, moving forwards.
            ",
            [page11],
            ["Continue"],
            :page10
        )

        pageE9 = Page.new(
            "
You turn your back and head towards the main road leading out of town. 
You don’t have time to investigate the disappearance of a town’s population, 
you have places to be. You head down the road and don’t look back when you hear 
honking in the distance.",
            [last_page],
            ["THE END"],
            :pageE9
        )


        page9 = Page.new(
            "
The girl shrugs.
‘I woke up this morning and my Ma wasn’t home, so I came out 
to look for her and all I found were these Geese!’ 
She giggled as they waddled closer ‘So I went home to grab 
some food for all my new friends’
‘Maybe the librarian will know, he knows everything’ She continued, 
pointing to a building on the far side of the square.
            ",
            [page10, pageE9],
            ["Investigate the library", "Leave this town forever"],
            :page9
        )

        page8 = Page.new(
            "
‘These are my friends’ she replies, throwing another handful of crumbs to them. 
They all rush towards the food with glee.
‘I don’t have a lot of friends but the geese are always kind to me’
            ",
            [page9],
            ["Ask her where the people are"],
            :page8
        )

        page7 = Page.new(
            "
You walk over to the sound near the fountain, and as you turn 
the corner you see a young girl humming as she feeds breadcrumbs 
to a group of about 6 geese. They are happily eating and following 
the girl as she leads them around the edge of the water. The girl 
notices you and looks up with an inquisitive smile.",
            [page9, page8],
            ["Ask her where the people are", "Ask her about the geese"],
            :page7
        )

        page6 = Page.new(
            "
You turn your back and head towards the main road leading out of town. 
You don’t have time to investigate the disappearance of a town’s population, 
you have places to be. You head down the road and don’t look back when you hear 
honking in the distance.",
            [last_page],
            ["THE END"],
            :page6
        )

        page5 = Page.new(
            "
You walk out into the main town square. Hessdale is a small town surrounded 
by forest and a small amount of farmland. When you arrived here in the late 
afternoon of the previous day it had been bustling with activity, but this 
morning everything is eerily silent. You cannot see another soul. You hear a 
voice coming from near the fountain, though soft it stands out in the silence. 
Should you investigate? Or are you too tired of these small town mysteries?",
            [page7, page6],
            ["Investigate", "Leave and don’t look back"],
            :page5
        )

        page4 = Page.new(
            "
You go into the kitchen and call out for the innkeeper… Marley, was it? 
The goose, still flailing wildly is startled at your voice. As you get closer 
it darts around behind you to the open door and back into the common area 
where it begins knocking down piles of plates and cups. You follow it back 
but it has now flown upstairs. Hopefully it will find a way out on it’s own.",
            [page5],
            ["Go outside"],
            :page4
        )

        page3 = Page.new(
            "
As you descend the stairs you hear some rattling in the kitchen, the innkeeper
must be up and at work already. But as you get closer you hear something 
else… flapping wings? You come to the common area and peek behind the door 
into the kitchen. You are shocked to find a shiny white goose flapping 
around the kitchen in a panic. He must have wandered in and gotten trapped.",
            [page4, page5],
            ["Help the goose", "It’s late, time to go"],
            :page3
        )
        
        page2 = Page.new(
            "
You dig through your pack and find a shiny red apple, a perfect way to start the day",
            [page3],
            ["Go downstairs"],
            :page2
        )
        
        page1 = Page.new(
            "
You wake up in a small but comfortable room in the upstairs of the Boartusk Inn. 
You have been travelling for well over a week now and it has been nice to stay in 
a real bed rather than a lumpy bedroll on the side of the road. You roll out of 
bed and stretch, it’s time to go!",
            [page2, page3],
            ["Maybe some breakfast first", "Go downstairs"],
            :page1
        )
        
        current_page = page1
        
        while current_page != last_page
        
            system('clear')
            puts current_page.story
            menu_options = current_page.option_text.each_with_index.map {|option, index| {name: option, value: index} }
            chosen_option = prompt.select("What would you like to do?", menu_options)
            new_page = current_page.options[chosen_option]
            if new_page.to_s.include? 'page'
                current_page = new_page
            else
                puts "Try as you might, you are not skilled enough for that"
                gets
            end
        end
        load ('index.rb')