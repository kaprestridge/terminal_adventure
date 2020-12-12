require 'tty-prompt'
prompt = TTY::Prompt.new

# module Validators
#     def self.validate_input(input)
#         input_string = input.to_s
#         if input_string.include?("page")
#             return true
#         else
#             return false
#         end
#     end
# end

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
    "You have reached the end",
    [0],
    ["no options"],
    :last_page
)

page3 = Page.new(
    "This is the page 2! Nice.",
    [0],
    ["no options"],
    :page3
)

page2 = Page.new(
    "This is the story where you picked 1, how cool!",
    [0],
    ["no options"],
    :page2
)

page1 = Page.new(
    "This is where the story goes, story is here this is a big block of text.
    Where would you like to go? 1 or 2?",
    [(2 > 15 ? (page2) : (nil)), page3],
    ["Use strength", "walk away"],
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


# end
    
# new_page = current_page.options[(hero_choice - 1)]
#     if new_page.to_s.include? 'page'
#         current_page = new_page
#     else
#         puts "you are not skilled enough for that"
#         gets
#     end


# end