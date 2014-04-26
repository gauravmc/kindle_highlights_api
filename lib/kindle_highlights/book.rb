module KindleHighlights
  class Book
    def initialize(page)
      @page = page
    end

    def self.from_page(page)
      Book.new(page)
    end

    def title
      @title ||= @page.search("span[class=title] a text()").first.content
    end

    def highlights
      @highlights ||= @page.search("span[class=highlight] text()").map(&:content)
    end
  end
end
