require 'test_helper'

module KindleHighlights
  class BooksFetcherTest < MiniTest::Unit::TestCase
    include FixturePages

    def test_fetch_returns_an_array_of_all_the_books
      fetcher = BooksFetcher.new('username', 'password')
      fetcher.stubs(:get_highlights_page).returns(fixture_pages(:highlights_page))
      assert_equal "Drawing on the Right Side of the Brain: The Definitive, 4th Edition", fetcher.send(:get_highlights_page).search("span[class=title]/a/text()").first.content
    end
  end
end
