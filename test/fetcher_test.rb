require 'test_helper'

module KindleHighlightsAPI
  class FetcherTest < MiniTest::Unit::TestCase
    def test_fetch_returns_an_array_of_all_the_books
      fetcher = Fetcher.new('some@email.com', 'password')

      books = fetcher.fetch_all

      assert_equal expected_book_titles, books.map(&:title)
      assert_equal 6, books.size
    end

    def test_fetch_each_returns_one_book_at_a_time
      fetcher = Fetcher.new('some@email.com', 'password')
      books = []

      fetcher.fetch_each do |book|
        books << book
      end

      assert_equal expected_book_titles, books.map(&:title)
      assert_equal 6, books.size
    end

    private

    def expected_book_titles
      [
        "Drawing on the Right Side of the Brain: The Definitive, 4th Edition",
        "Mucusless Diet Healing System",
        "Crucial Conversations Tools for Talking When Stakes Are High, Second Edition",
        "The War of Art",
        "Smalltalk Best Practice Patterns",
        "A Short History of Nearly Everything"
      ]
    end
  end
end
