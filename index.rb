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
puts "Welcome #{hero_name}"

question_list = [
    question1 = Hero_Questions.new(
        "What is your favorite colour?",
        answer_options = {"blue" => proc { hero.change_str(1)}, "pink" => proc { hero.change_dex(1)} }
    ),
    question2 = Hero_Questions.new(
        "What is your favorite colour?2",
        answer_options = {"blue" => proc { hero.change_str(1)}, "pink" => proc { hero.change_dex(1)} }
    ),
    question3 = Hero_Questions.new(
        "What is your favorite colour?3",
        answer_options = {"blue" => proc { hero.change_str(1)}, "pink" => proc { hero.change_dex(1)} }
    ),
    last_question = Hero_Questions.new(
        "What is your favorite colour?4",
        answer_options = {"blue" => proc { hero.change_str(1)}, "pink" => proc { hero.change_dex(1)} }
    )
    ]

    question_list.each { |q, a| 
        puts q
        menu_options = answer_options.map{|option, index| {name: option, value: index} }
        hero_answer = prompt.select('Your answer:', menu_options)
        }