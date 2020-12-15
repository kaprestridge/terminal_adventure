require 'tty-prompt'
prompt = TTY::Prompt.new

class Hero
    attr_accessor :str, :dex, :con, :int, :wis, :cha
    def initialize(name)
        @name = name
        @str = 10
        @dex = 10
        @con = 10
        @int = 10
        @wis = 10
        @cha = 10
      end
    def change_str(str)
        @str += str    
    end
    def change_dex(dex)
        @dex += dex    
    end
    def change_con(con)
        @con += con    
    end
    def change_int(int)
        @int += int    
    end
    def change_wis(wis)
        @wis += wis    
    end
    def change_cha(cha)
        @cha += cha    
    end
end


puts "What is your name?"
hero_name = gets.chomp.to_s.capitalize
hero = Hero.new(hero_name)


class Hero_Questions (Hero)
    attr_reader :answer_options
    def initialize (question_text, answer_options)
        @question_text = question_text
        @answer_options = answer_options
    end
    def to_s
        @question_text
    end
end

{"blue" => proc { hero.change_str(1) } }



puts hero_name
puts hero.str
puts hero.dex
puts hero.con
puts hero.int
puts hero.wis
puts hero.cha

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


puts hero.str
puts hero.dex
puts hero.con
puts hero.int
puts hero.wis
puts hero.cha
