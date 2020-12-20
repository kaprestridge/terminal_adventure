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