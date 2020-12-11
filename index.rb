require "tty-prompt"
require "colorize"
require "json"
prompt = TTY::Prompt.new

# def welcome_screen (prompt)
#     system ('clear')
#     puts'
#      _______  _______  _______     _______. _______    ____    __    ____  ___      .______      
#     /  _____||   ____||   ____|   /       ||   ____|   \   \  /  \  /   / /   \     |   _  \     
#    |  |  __  |  |__   |  |__     |   (----`|  |__       \   \/    \/   / /  ^  \    |  |_)  |    
#    |  | |_ | |   __|  |   __|     \   \    |   __|       \            / /  /_\  \   |      /     
#    |  |__| | |  |____ |  |____.----)   |   |  |____       \    /\    / /  _____  \  |  |\  \----.
#     \______| |_______||_______|_______/    |_______|       \__/  \__/ /__/     \__\ | _| `._____|
    
    
#     '.cyan

#     puts 'Welcome to Geese, a text based adventure game right here in your terminal'
    

#         menu_options = [
#             {name: "New Game", value: 1},
#             {name: "Continue", value: 2},
#             {name: "Help", value: 3},
#             {name: "Exit", value:4}
#         ]
#         chosen_option = prompt.select("What would you like to do?", menu_options)
# end

# welcome_screen(prompt)
file = File.read('book.json')
book = JSON.parse(file)
current_page = book["page1"]
puts current_page["story"]