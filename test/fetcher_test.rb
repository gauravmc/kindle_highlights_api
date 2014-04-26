require 'test_helper'

module KindleHighlights
  class FetcherTest < MiniTest::Unit::TestCase
    include FixturePages

    def test_fetch_returns_an_array_of_all_the_books
      fetcher = Fetcher.new('username', 'password')
      fetcher.stubs(:get_highlights_page).returns(get_page_from_fixtures(:highlights_page))
      books = fetcher.fetch
      expected_title = "Drawing on the Right Side of the Brain: The Definitive, 4th Edition"
      assert_equal expected_title, books.first.title
    end
  end
end
