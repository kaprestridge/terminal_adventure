class Hero
    attr_reader :str, :dex, :con, :int, :wis, :cha
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
hero_name = gets.chomp.to_s
hero = Hero.new

class Hero_Questions (hero)
    def initialize (question_text, answer_options)
        @question_text = question_text
        @answer_options = answer_options [0..]
    end
end

question1 = Hero_questions.new (
    "What is your favorite colour?",
    {"blue" => Hero.change_str(1), "red" => Hero.change_cha(2), "green" => Hero.change_con(2)},
)