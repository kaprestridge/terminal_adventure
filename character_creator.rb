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
    def initialize (question_text, answer_options)
        @question_text = question_text
        @answer_options = answer_options[0..]
    end
    def to_s
        @question_text
    end
end

question1 = Hero_Questions.new(
    "What is your favorite colour?",
    answer_options1 = {"blue" => hero.change_str(1), "green" => hero.change_con(1)}
)



puts hero_name
puts hero.str
puts hero.dex
puts hero.con
puts hero.int
puts hero.wis
puts hero.cha

puts question1






puts hero.str
puts hero.dex
puts hero.con
puts hero.int
puts hero.wis
puts hero.cha