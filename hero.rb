class Hero
    def initialize(name, health)
        @name     = name
        @health   = health
      end
    def stat_block(str, dex, con, int, wis, cha)
        @str = 10
        @dex = 10
        @con = 10
        @int = 10
        @wis = 10
        @cha = 10
    end
    #In Hero I want... Name, Hit points, Stats, Inventory.
end

puts Hero.stat_block()