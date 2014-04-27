require 'test_helper'

module KindleHighlights
  class FetcherTest < MiniTest::Unit::TestCase
    def test_fetch_returns_an_array_of_all_the_books
      fetcher = Fetcher.new('some@email.com', 'password')

      books = fetcher.fetch

      expected_books = [
        "Drawing on the Right Side of the Brain: The Definitive, 4th Edition",
        "Mucusless Diet Healing System",
        "Crucial Conversations Tools for Talking When Stakes Are High, Second Edition",
        "The War of Art",
        "Smalltalk Best Practice Patterns",
        "A Short History of Nearly Everything"
      ]

      assert_equal expected_books, books.map(&:title)
      assert_equal 6, books.size
    end
  end
end
