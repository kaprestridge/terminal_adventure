require "tty-prompt"
prompt = TTY::Prompt.new
require "colorize"
require_relative "hero.rb"
require_relative "story.rb"


def welcome_screen (prompt)
    system ('clear')
    puts"

     _______   ______     ______        _______. ___________    ____                  
    /  _____| /  __  \\   /  __  \\      /       ||   ____\\   \\  /   /                  
   |  |  __  |  |  |  | |  |  |  |    |   (----`|  |__   \\   \\/   /                   
   |  | |_ | |  |  |  | |  |  |  |     \\   \\    |   __|   \\_    _/                    
   |  |__| | |  `--'  | |  `--'  | .----)   |   |  |____    |  |                      
    \\______|  \\______/   \\______/  |_______/    |_______|   |__|                      
                                                                                      
    .______    __    __       _______. __  .__   __.  _______     _______.     _______.
    |   _  \\  |  |  |  |     /       ||  | |  \\ |  | |   ____|   /       |    /       |
    |  |_)  | |  |  |  |    |   (----`|  | |   \\|  | |  |__     |   (----`   |   (----`
    |   _  <  |  |  |  |     \\   \\    |  | |  . `  | |   __|     \\   \\        \\   \\    
    |  |_)  | |  `--'  | .----)   |   |  | |  |\\   | |  |____.----)   |   .----)   |   
    |______/   \\______/  |_______/    |__| |__| \\__| |_______|_______/    |_______/    
                                                                                                                                                                       
   
    ".cyan

    puts 'Welcome to Goosey Business, a text based adventure game right here in your terminal'
    

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
    puts "HELP".cyan
    puts "Goosey Business is a text based RPG set in your terminal. You play as a hero
who is travelling through a small village and finds something isn't quite right!
It is written and programed by Kathryn Prestridge as part of her Coder Academy course.
In order to complete the game there will be times where your skills will be tested,
if your heros stats are lower than that of the required option you will be unable to proceed
down that path. You will then need to select a different option. Test your skills and try to
unravel the mystery and complete the game"
    puts "For questions please contact me on twitter @katprestridge"
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
if hero_name.size > 0 && hero_name.size < 10
        hero_name_valid = true
      else
        hero_name_valid = false
      end
    
    while hero_name_valid == false
      puts "Sorry, please enter a name between 1 and 10 characters long"
        hero_name = gets.chomp.to_s.capitalize
        if hero_name.size > 0 && hero_name.size < 10
            hero_name_valid = true
          else
            hero_name_valid = false
          end
    end
hero = Hero.new(hero_name)
system('clear')

question_list = [
    question1 = Hero_Questions.new(
        "What is your favorite colour?",
        answer_options1 = {"Red" => proc { hero.change_str(2)}, "Blue" => proc { hero.change_dex(2)}, "Green" => proc { hero.change_cha(2)}, "Yellow" => proc { hero.change_wis(2)}, "Pink" => proc { hero.change_int(2)} }
    ),
    question2 = Hero_Questions.new(
        "You come face-to-face with your worst enemy, how do you react?",
        answer_options2 = {"Challenge them to a fight" => proc { hero.change_str(2)}, "Slip behind the nearest cover and hope they didn't see you" => proc { hero.change_dex(2)}, "Walk the other way" => proc { hero.change_int(2)}, "I don't have enemies, everyone loves me" => proc { hero.change_cha(2)} }
    ),
    question3 = Hero_Questions.new(
        "Are you a morning person?",
        answer_options3 = {"Yes, the early bird gets the worm" => proc { hero.change_int(2)}, "I'm more of a night-owl" => proc { hero.change_wis(2)}, "I never sleep" => proc { hero.change_str(2)}, "I just nap constantly" => proc { hero.change_wis(2)} }
    ),
    question4 = Hero_Questions.new(
        "Do you prefer cats or dogs?",
        answer_options4 = {"I like them both equally" => proc { hero.change_wis(2)}, "Cats, of course" => proc { hero.change_dex(2)}, "Dogs are superior" => proc { hero.change_cha(2)}, "Both are useless" => proc {hero.change_str(2)}, "I prefer lizards" => proc {hero.change_int(2)} }
    ),
    question5 = Hero_Questions.new(
        "Do you like being the center of attention?",
        answer_options4 = {"Always!" => proc { hero.change_cha(2)}, "I prefer to stay in the shadows" => proc { hero.change_dex(2)}, "Only around close friends" => proc { hero.change_int(2)}, "If I can show off my muscles" => proc { hero.change_str(2)} }
    ),
    question6 = Hero_Questions.new(
        "What do you do to feel better when you’re sad?",
        answer_options4 = {"Start a fight" => proc { hero.change_str(2)}, "Talk to a friend" => proc { hero.change_wis(2)}, "Listen to music" => proc { hero.change_cha(2)}, "Drink" => proc { hero.change_int(2)} }
    ),
    question7 = Hero_Questions.new(
        "As a kid, what did you want to be when you grew up?",
        answer_options4 = {"An actor" => proc { hero.change_cha(2)}, "A baker" => proc { hero.change_dex(2)}, "A scholar" => proc { hero.change_int(2)}, "A politician" => proc { hero.change_int(2)} }
    ),
    question8 = Hero_Questions.new(
        "Do you admit to mistakes when you make them?",
        answer_options4 = {"I would but I never make mistakes" => proc { hero.change_str(2)}, "Always, it is the best way to learn" => proc { hero.change_wis(2)}, "Only if I'm forced to" => proc { hero.change_cha(2)} }
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


        
        last_page = Page.new(
            " ",
            [0],
            [" "],
            :last_page
        )
        pagea51 = Page.new(
            "
                                  ___
                               ,-""   `.
                             ,'  _   e )`-._     HONK
                            /  ,' `-._<.===-'
                           /  /
                          /  ;
              _          /   ;
 (`._    _.-"" ""--..__,'    |
 <_  `-""                     \
  <`-                          :
   (__   <__.                  ;
     `-.   '-.__.      _.'    /
        \      `-.__,-'    _,'
         `._    ,    /__,-'
            ""._\__,'< <____
                 | |  `----.`.
                 | |        \ `.
                 ; |___      \-``
                 \   --<
                  `.`.<
                    `-'",
            [last_page],
            ["The End".green],
            :pagea51
        )
        pagea50 = Page.new(
            "
You hand George the remaining cure, happy that he can take it from here. 
You really are running late, and should get back on the road. As you walk a
way you hear the honks of geese intermingled with happy greeting from 
townsfolk back in their normal forms, and one very angry woman scolding a little girl…",
            [pagea51],
            ["You saved the town! Congratulations!".green],
            :pagea50
        )
        pagea49 = Page.new(
            "You pocket the letter, not sure if handing it over to this young girl is a good idea…",
            [pagea50],
            ["Say Goodbye"],
            :pagea49
        )
        pagea48 = Page.new(
            "
You walk over to the crying girl and hand her the letter. She wipes 
her eyes clear and looks down at it. Pulling it open a handful of runes 
flash to life. You don’t understand them but the girls eyes flash with a mischievous glee.",
            [pagea50],
            ["Say Goodbye"],
            :pagea48
        )
        pagea47 = Page.new(
            "
‘Looks like we have a suspect’ says George at your side ‘What on earth is 
going on here Tilly?’
‘I just wanted my friends to be nice to me!’ She cried ‘They were saying 
mean things and I wanted them to be kind, like the geese at the river!’
George looked equal parts angry and amused.
‘Well you’re lucky this traveller came along and helped, else you’d not 
be happy in a few days without your Ma’ He said
The girl began to cry ‘I just wanted it to work on my friends, not the whole town’
George walked over and took the scrunched up paper from her small hands.
‘That is what happens when people cast hex’s they know naught about’ He chided.",
            [pagea48, pagea49],
            ["Give the girl the letter", "Say goodbye and leave"],
            :pagea47
        )
        pagea46 = Page.new(
            "
You head to the fountain, hoping the group from earlier are still 
gathered there. The girl who is sitting on the water’s edge waves 
a hand at you, happily surrounded by her goose friends.
‘Hello! What are you doing back here?’ She asks cheerfully.
Noticing you begin to try to feed the geese she suddenly yells ‘HEY, WHAT ARE YOU DOING!? STOP THAT!’",
            [pagea47],
            ["Continue"],
            :pagea46
        )
        pagea45 = Page.new(
            "
George eats the dried riverweed, then closes his eyes tightly… 
A bright light begins to emanate from him and after a few moments, 
before you stands a disheveled gnome. He grins and jumps from leg 
to leg, stretching as if testing that it really is himself again.
‘Ahhhh’ He sighs ‘That’s better! I think if I had to waddle one more step I would have gone mad’
‘Thank you so much, you have saved me and this entire town! Speaking of, let's go wrangle some geese!’",
            [pagea46],
            ["Wrangle some Geese!"],
            :pagea45
        )
        pagea44 = Page.new(
            "
You head back to town, the trip much faster now that you know the safest path 
and the hazards along the way. When you arrive back in town there is a goose 
by the path, pacing backwards and forwards, leaving ink in its wake. George.",
            [pagea45],
            ["Give George the cure"],
            :pagea44
        )
        pagea43 = Page.new(
            "
‘Ahhhh, here it is! Yes a very simple hex but powerful if done correctly. 
Fortunately the cure is easily found. Just give the subject some of this 
dried riverweed…’ She hands you a paper packet with a smile.
‘There is a catch, of course, when you find whoever did this you give them this letter’ 
She continues, handing you a purple envelope with a red seal.
‘I will know if you fail to do so’ Her voice tells you she is not kidding, and so 
you nod, turning to leave this place as quickly as possible.",
            [pagea44],
            ["Head back to town"],
            :pagea40
        )
        pagea42 = Page.new(
            "
‘GEESE!!?!’ She chokes ‘How I wish that was my doing… but alas, 
I did not think of something so devilishly clever. I’m sure I know 
the spell you mean, I have the book here somewhere…’
She seems to have almost forgotten your existence… You wait quietly 
for her to finish searching.",
            [pagea43],
            ["Continue"],
            :pagea42
        )
        pagea41 = Page.new(
            "
You turn and run, Istval’s laughter ringing out behind you. Why 
did you ever decide to come on this ridiculous quest? Time to go 
home and forget all about this place. You failed to save the town 
but at least you saved yourself.",
            [last_page],
            ["The End".red],
            :pagea41
        )
        pagea40 = Page.new(
            "
‘Well maybe you should have thought of that before BREAKING INTO MY HOME’ 
She snarled, crossing her arms over her chest.",
            [pagea42, pagea41],
            ["Tell her about the Geese", "Run Away"],
            :pagea40
        )
        pagea39 = Page.new(
            "
Her hand, outstretched towards you, turns to a fist, you feel your vision fading…",
            [last_page],
            ["GAME OVER".red],
            :pagea30
        )
        pagea38 = Page.new(
            "
You manage to push the cauldren over, then throw yourself at the Fae, 
swinging wildly. She laughs, then puts up a hand, freezing you mid-air.
‘Give me one good reason not to kill you right now’ she snarls.",
            [(hero.wis > 12 ? (pagea40) : (nil)), pagea39],
            ["Give up and try to explain (Wisdom >12)", "Stay Silent"],
            :pagea38
        )
        pagea37 = Page.new(
            "
‘HOW DARE YOU!!’ Comes a voice, mere seconds after the door creaks open.
You feel yourself flung up against the wall, sliding to a heap on the floor.
You manage to dive behind a nearby cauldron and take a moment to gather yourself.",
            [pagea40, (hero.cha > 12 ? (pagea40) : (nil)), (hero.str > 11 ? (pagea38) : (nil))],
            ["Shout that you mean no harm", "Tell her you seek her wisdom oh great Fae Istval (Charisma >12)", "Knock the cauldron over, and race to attack (Strength >11)"],
            :pagea37
        )
        pagea36 = Page.new(
            "
Istval begins to laugh wildly…
‘GEESE!!?!’ She chokes ‘How I wish that was my doing… but alas, I 
did not think of something so devilishly clever. I’m sure I know 
the spell you mean, I have the book here somewhere…’
The vines suddenly drop you in a heap on the ground. Istval turns and walks back to the tower, still laughing.",
            [pagea43],
            ["Continue"],
            :pagea36
        )
        pagea35 = Page.new(
            "
‘Well now, that just won’t do. I can’t just let pesky humans into 
my home and garden. You have excellent timing though… Mildred here was getting hungry…’
You try to kick free but it’s no use…",
            [last_page],
            ["GAME OVER".red],
            :pagea35
        )
        pagea34 = Page.new(
            "
You are so focused on the door that you don’t notice the vines 
creeping up and around your ankle until it is too late. You are 
pulled up and into the air, then dangled over the open maw of a 
carnivorous flower.
‘Thank you pet’ Comes a voice from inside. Istval walks out of the tower, arms crossed.
‘Now what are you doing here… human’ she almost spits the last word as if it is an insult.",
            [(hero.cha > 11 ? (pagea36) : (nil)), (hero.int > 12 ? (pagea36) : (nil)), pagea35],
            ["Try to explain (Charisma >11)", "Tell her you need her help (Intelligence > 12)", "Keep silent"],
            :pagea34
        )
        pagea33 = Page.new(
            "
You decide to wait outside to scope out the tower first. Who knows 
what you’re getting into. All you know about Istval is that she is 
a Fae, and Fae are rarely able to be trusted. You find a spot amongst 
the plants in the garden and watch the door.",
            [pagea34],
            ["Continue"],
            :pagea333
        )
        pagea32 = Page.new(
            "
The base of the tower comes into view. A chaotic looking garden surrounds 
it’s entrance, vines, flowers and fruits growing at every angle. You walk 
carefully towards the single door, the only entrance to the tower. You 
can hear movement inside, but you don’t think your presence has 
been noticed yet.",
            [(hero.dex > 13 ? (pagea37) : (nil)), (hero.str > 12 ? (pagea37) : (nil)), pagea33],
            ["Sneak in (Dex >13)", "Kick the door down (Strength >12)", "Bide your time and wait outside"],
            :pagea32
        )
        pagea31 = Page.new(
            "
You manage to get around the beast and back on track. 
You can see the tower getting closer, not long now!",
            [pagea32],
            ["Continue"],
            :pagea31
        )
        pagea30 = Page.new(
            "
You bolt through the trees back the way you came, and hear a yell 
of grotesque joy from behind you. Unfortunately the speed of a human is 
nothing compared to the size and strength of an Ogre…",
            [last_page],
            ["GAME OVER".red],
            :pagea30
        )
        pagea29 = Page.new(
            " 
Crack! A branch snaps beneath your foot. Of course it does",
            [(hero.cha > 11 ? (pagea31) : (nil)), pagea30],
            ["Make a bird noise to disguise yourself (Charisma >11)", "RUN!!"],
            :pagea29
        )
        pagea28 = Page.new(
            "
As you begin your walk up the slope, you hear a deep rumbling laugh. 
That can’t be good… In the clearing ahead you make out the shape of a 
large humanoid… an Ogre. There is no mistaking that smell. Around the 
mouth of the cave is littered with bones, some belonging to animals, 
others… something else. To one side suspended from a tree is a cage with the 
nameplate ‘Nick’, it’s occupant long perished. Best to avoid this place.",
            [(hero.dex > 12 ? (pagea31) : (nil)), pagea29],
            ["Sneak past (Dexterity >12)", "Turn back, there must be another way"],
            :pagea28
        )
        pagea27 = Page.new(
            "
You wake up on the shore… somewhere downriver of where you started. 
You have no clue how much time has passed but you’d better not spend 
any longer here. In the distance you can still make out the tower, 
though it is considerably further away now. Ah well, at least you’re 
on the correct side of the river now!",
            [pagea28],
            ["Continue"],
            :pagea27
        )
        pagea26 = Page.new(
            "
You jump into the river without a care, I’m sure it will be fine. 
You wade to around the halfway point, when the water becomes too 
deep and you have to swim. You push yourself up… and are immediately 
swept up and down river….",
            [pagea27],
            ["Continue"],
            :pagea26
        )
        pagea25 = Page.new(
            "
You grab a hold of the edge of the bridge, and use it to drag yourself 
to the shore. You wring out your clothing the best you can, then begin 
to trudge up the path to the tower.",
            [pagea32],
            ["Continue"],
            :pagea25
        )
        pagea24 = Page.new(
            "
You step carefully across the bridge, testing your weight 
on each step as you continue across. When you are just a few 
steps away, the bridge cracks and splinters beneath you, 
pulling your feet out from under you and throwing you into the water.",
            [(hero.dex > 11 ? (pagea25) : (nil)), pagea27],
            ["Grab hold of the bridge (Dexterity >11)", "Let go"],
            :pagea24
        )
        pagea23 = Page.new(
            "
Deciding this is not the best place to cross you make your way upstream, 
eventually coming across a bridge! It looks questionable at best, 
but you figure it is better than swimming with no help.",
            [pagea24],
            ["Cross the bridge"],
            :pagea23
        )
        pagea22 = Page.new(
            "
You jump back in the water, confident in your swimming ability. 
The river is flowing quickly, but you manage to fight it’s current 
and make it to the other side. You wring out your clothing the best 
you can, then begin to trudge up the path to the tower.",
            [pagea32],
            ["Continue"],
            :pagea22
        )
        pagea21 = Page.new(
            "
You dive into the water, finally able to breath again after washing 
the spores from your clothing. Well, you may be soaked, but you’re 
alive and you found the river. You take a moment to wonder if the geese 
were really worth it. Up ahead you see the top of a stone tower… At 
least you’re on the right track, now just to get across this river.",
            [(hero.str > 12 ? (pagea22) : (nil)), pagea23, pagea26],
            ["Swim (strength >12)", "Go upriver", "Dive in!"],
            :pagea21
        )
        pagea20 = Page.new(
            "
You have encountered this plant before, more than once. You 
also know many adventurers have fallen to its poison. You wave 
the spores away from your face and run. You can feel the edges 
of your vision begin to fade, but you shake it off and continue on… 
there it is, the river!",
            [pagea21],
            ["Continue"],
            :pagea20
        )
        pagea19 = Page.new(
            "
You’ve seen that mushroom before, and you know what it’s 
spores can do to a person. You hold your breath tightly and 
hope that there is some water nearby. You run forward, almost 
tripping over tree-roots and debris. You see the river ahead, 
almost there!",
            [pagea21],
            ["Continue"],
            :pagea19
        )
        pagea18 = Page.new(
            "
You look down at your boot, now covered in spores and sigh, that’s 
going to take forever to clean. The spores continue to rise as you 
take another step forward… That’s funny, they smell like… actual 
mustard. You giggle, then feel your vision begin to fade….",
            [last_page],
            ["GAME OVER".red],
            :pagea18
        )
        pagea17 = Page.new(
            "
You take the path to the right and continue moving through the forest. 
The trees become thicker as you travel further on, and the plantlife 
more strange. You notice some large carnivorous flowers off to the side, 
which you decide to give a wide berth. The path becomes less well-trodden 
and more plant life seems to overtake it as you move forward. You step 
over a rotting branch and… right into a giant mushroom! As you look 
down you see mustard-yellow spores rising from where your foot is.",
            [pagea18, (hero.int > 11 ? (pagea19) : (nil)), (hero.con > 11 ? (pagea20) : (nil))],
            ["Ignore it and keep walking", "Hold your breath! (Intelligence >11)", "Wave the spores away (Constitution >11)"],
            :pagea17
        )
        pagea16 = Page.new(
            "
You find yourself safe on the northern bank. You try to dry yourself 
off as best as you can, but it looks like you’ll just be walking in 
damp clothes from here on. You sigh, wondering if these geese are worth it. 
Looking ahead and noticing the very tip of a grey stone tower in 
the distance! At last!",
            [pagea32],
            ["Continue towards the tower"],
            :pagea16
        )
        pagea15 = Page.new(
            "
You decide to trust the bridge, it looks sturdy enough to you. 
You walk carefully, testing each step before shifting your weight. 
It seems to be holding. You get most of the way across, your 
confidence growing, before your foot slips, throwing you into 
the icy river.",
            [pagea27],
            ["Continue"],
            :pagea15
        )
        pagea14 = Page.new(
            "
Deciding the bridge looks too risky, you notice a nearby 
tree that has been overtaken by vines, some hanging out over 
the water. You find the longest one and tie it around your waist. 
Feeling more secure you head back to the water's edge and 
begin to cross the bridge. You get most of the way across before 
your foot slips, throwing you into the icy river. Luckily 
the rope holds fast and you are able to drag yourself to the river bank.",
            [pagea16],
            ["Continue"],
            :pagea14
        )
        pagea13 = Page.new(
            "
You hold on as tightly as you can to try and regain your footing, 
but the rock shudders under the force of the water and begins to 
dislodge, throwing you into the cold water below.",
            [pagea27],
            ["Continue"],
            :pagea13
        )
        pagea12 = Page.new(
            "
You dart forward to the next rock and dive to the other bank, 
looking back you watch as the rock you were standing on moments 
ago dislodges and floats down the river….",
            [pagea16],
            ["Continue"],
            :pagea12
        )
        pagea11 = Page.new(
            "
You decide you trust your feet more than that bridge and head 
downstream to the rocky path. You test the first step gingerly, 
but then decide to just go for it. At the halfway point you feel 
one of the rocks begin to dislodge…",
            [(hero.dex > 12 ? (pagea12) : (nil)), pagea13],
            ["Jump forward (Dexterity >12)", "Hold on tight!"],
            :pagea11
        )

        pagea10 = Page.new(
            "
You make it to the river’s edge and look behind you… Doesn’t 
look like you were followed, but it’s probably best not to hang 
around to find out. In front of you the path reaches the river's 
edge and a small bridge spans it’s width. The water is running 
faster than you would have expected this far inland, and it is 
high enough that the questionable bridge has water running over 
it center. There is a makeshift rocky path that also crosses 
slightly downriver.",
            [pagea15, (hero.dex > 11 ? (pagea11) : (nil)), (hero.wis > 11 ? (pagea14) : (nil))],
            ["Take the bridge, it looks fine", "Try the rocky path (Dexterity >11)", "Inspect a nearby tree covered in vines (Wisdom >11)"],
            :pagea10
        )
        pagea9 = Page.new(
            "
You dart into the woods, hopefully the cover of the trees will protect you. 
Unfortunately it also means you’ve lost sight of it. You head towards the 
sound of water in the distance, slowly through the densely wooded area. 
You suddenly feel a barrier in front of you… a web. 
You try to turn the other way but it’s too late. The beast descends upon you…",
            [last_page],
            ["GAME OVER".red],
            :pagea9
        )
        pagea8 = Page.new(
            "
The second you see the beast you turn to run, you don’t want to wait and 
see what happens next. You hear the sound of the spider scurrying 
behind you, he won’t give up that easily. You look over your shoulder 
just in time to see it jump at you, and you dodge quickly to the side, 
watching the spider fly past you. It looks stunned, you keep running, 
hoping it doesn’t recover in time to catch up.",
            [pagea10],
            ["Head to the river"],
            :pagea8
        )
        pagea7 = Page.new(
            "You turn quickly and run towards the sound of rushing water… 
            hopefully the spider doesn’t follow you.",
            [pagea10],
            ["Head to the river"],
            :pagea7
        )
        pagea6 = Page.new(
            "
    You hit the spider a second time with the branch, causing your makeshift 
    weapon to snap in two. The spider seems to have stopped moving, but you don’t 
    think you should stick around to find out.",
            [pagea10],
            ["Head to the river"],
            :pagea6
        )
        pagea5 = Page.new(
            "
You grab a nearby dead branch and pull it from the tree, holding it 
forward to defend yourself from the beast. It scuttles forward and launches 
itself at you, fangs bared. You manage to hit it back, right on the creatures head. 
It looks stunned, now is your chance!",
            [(hero.str > 15 ? (pagea6) : (nil)), pagea7],
            ["Hit it again (Strength >15)", "Run away!"],
            :pagea5
        )
        pagea4 = Page.new(
            "
You feel a chill run up your spine as you hear a rustle behind you 
and then a breeze touches your neck where the air was previously 
unusually still. You turn slowly and find yourself facing a spider 
the size of a large dog.",
            [(hero.str > 11 ? (pagea5) : (nil)),(hero.dex > 11 ? (pagea8) : (nil)), pagea9],
            ["Pick up a stick and try to push the beast back (Strength >11)", "Turn and try to outrun the beast (Dexterity > 11)", "Run into the trees to hide"],
            :pagea4
        )
        pagea3 = Page.new(
            "
You take the path to the left and continue moving through the forest. 
After a time the canopy becomes more dense and the path dims. You notice 
the air becoming cool and damp, which isn’t unwelcome after walking for 
over an hour. Up ahead you hear the sound of running water, the river 
mustn’t be far now!",
            [pagea4],
            ["Continue on"],
            :pagea3
        )
        pagea2 = Page.new(
            "
You head towards the path leading out of town to the north, 
passing quite a few geese you now assume are the townsfolk. You nod 
politely to them as you pass while they honk and run seemingly randomly 
around the town. You reach the path and begin your journey into the forest.
Not long after starting out, the path forks in two, as all paths in adventures 
seem to do. George didn’t mention this part.",
            [pagea3, pagea17],
            ["Go left", "Go right"],
            :pagea2
        )
        pagea1 = Page.new(
            "
You decide to head to the root of the problem, who needs books? 
George nods his small white head.
‘Great idea, her tower is just on the other side of the river North of town, 
head to the path and follow it until you see the tower in the clearing, it’s 
hard to mi…. HONK’ His voice suddenly changes back to the frantic honking of 
a goose. George must have realised his words no longer had meaning by your 
expression and he sighed (or at least you think that’s what he did).
             ",
            [pagea2],
            ["Head towards the tower"],
            :pagea1
        )
        pageb1 = Page.new(
            "
Sorry Traveller, This path is coming soon, for now let's go to Istval!".red,
            [pagea1],
            ["Go find Istval!"],
            :pageb1
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
            [pagea1, pageb1],
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
            ["THE END".red],
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
            ["THE END".red],
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
                puts "Try as you might, you are not skilled enough for that choice"
                gets
            end
        end
        load ('index.rb')