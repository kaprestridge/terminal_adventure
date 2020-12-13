# require "tty-prompt"
# prompt = TTY::Prompt.new
require "colorize"
require "json"
require_relative "hero.rb"


# def welcome_screen (prompt)
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


welcome_screen(prompt)

#Character creation
#select method??
#Give each item a value, return only truthy, .select, then alter these numbers when hero stats get higher.

#story loop
file = File.read('book.json')
book = JSON.parse(file)
current_page = book["page1"]
puts current_page["story"]

hero = Hero.new(name)

i = 0
if current_page["has_requirements"] != true
    options = current_page["option_names"].each do |x|
        {name: "#{x}", value: i}
        i += 1
    end
else
    requirements = current_page["requirements"]
    if eval(requirements)
        options = current_page["option_names"].each do |x|
            {name: "#{x}", value: i}
            i += 1
        end
    else
        
    end

end




# prompt.select("Which page would you like to go to?", options)
