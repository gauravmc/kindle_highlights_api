$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/autorun'
require 'kindle_highlights_api'
require 'pry'

class FetcherIntegrationTest < MiniTest::Unit::TestCase
  EMAIL = Base64.decode64("a2luZGxlLmhpZ2hsaWdodHMuYXBpQGdtYWlsLmNvbQ==\n")
  PASS = Base64.decode64("aGlnaGxpZ2h0c2FwaTEyMw==\n")

  def test_fetch_all
    fetcher = KindleHighlightsAPI::Fetcher.new(EMAIL, PASS)
    expected_titles = ["Les Misérables (English language)", "A Tale of Two Cities", "The Rámáyan of Válmíki"]

    expected_highlights = ["The coffee-room had no other occupant, that forenoon, than the gentleman in brown.",
 "A large cask of wine had been dropped and broken, in the street.",
 "For, the time was to come, when the gaunt scarecrows of that region should have watched the lamplighter,",
 "Then, as the darkness closed in, the daughter laid her head down on the hard ground close at the father's side, and watched him.",
 "A woman of orderly and industrious appearance rose from her knees in a corner, with sufficient haste and trepidation to show that she was the person referred to."]

    books = fetcher.fetch_all

    assert_equal expected_titles, books.map(&:title)
    assert_equal expected_highlights, books[1].highlights
  end
end
