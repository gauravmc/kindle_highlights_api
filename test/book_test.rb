require 'test_helper'

module KindleHighlights
  class BookTest < MiniTest::Unit::TestCase
    include FixturePages

    def test_from_page_creates_a_book_from_the_page
      expectation = {
        title: "Drawing on the Right Side of the Brain: The Definitive, 4th Edition",
        highlight: "learning to draw, without doubt, causes new connections in the brain that can be useful over a lifetime for general thinking. Learning to see in a different way requires that you use your brain differently."
      }

      book = Book.from_page(get_page_from_fixtures(:highlights_page))

      assert_equal expectation[:title], book.title
      assert book.highlights.include?(expectation[:highlight])
    end
  end
end
