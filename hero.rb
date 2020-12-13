class Hero
    attr_reader :str :dex :con :int :wis :cha
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



class Page
    def initialize(page_name, top_image, story) 
        @page_name = page_name
        @top_image = top_image
        @story = story
    end

end

page1 = Page.new("Page one", 
    "THIS IS AN IMAGE", 
    "This is the story here hello")

def print_page(current)
    puts current.page_name
    puts current.top_image
    puts current.story
end

current = page1
puts print_page(page1)