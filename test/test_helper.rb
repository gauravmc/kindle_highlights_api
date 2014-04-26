$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/autorun'
require 'kindle_highlights'
require 'pry'
require 'mocha/mini_test'
require 'pry-rescue/minitest'

TEST_ROOT = File.expand_path('..', __FILE__)

module FixturePages
  def fixture_pages(page)
    uri = URI("https://anydomain.com/any/path")
    code = "200"
    response = Net::HTTPFound.new(nil, code, nil)
    body = File.open("#{TEST_ROOT}/fixtures/html/#{page.to_s}.html").read
    mech = Mechanize.new
    Mechanize::Page.new(uri, response, body, code, mech)
  end
end
