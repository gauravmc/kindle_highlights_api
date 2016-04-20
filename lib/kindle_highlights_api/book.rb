module KindleHighlightsAPI
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

    def highlights_with_location
      @locations ||= @page.links_with(href: /^kindle/).map(&:href)
      @highlights ||= @page.search("span[class=highlight] text()").map(&:content)

      @highlights.each_with_index.map do |hl, i|
        { content: hl, location: @locations[i] }
      end
    end
  end
end
