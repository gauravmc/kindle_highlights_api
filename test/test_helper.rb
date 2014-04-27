$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/autorun'
require 'kindle_highlights'
require 'pry'
require 'mocha/mini_test'
require 'pry-rescue/minitest'
require 'fakeweb'

TEST_ROOT = File.expand_path('..', __FILE__)

def mock_web_requests
  FakeWeb.allow_net_connect = false

  kindle_home_url = "https://kindle.amazon.com"

  FakeWeb.register_uri(:get, "#{kindle_home_url}/login", body: fixture_body(:login_page), content_type: "text/html")
  FakeWeb.register_uri(:post, %r{https://www.amazon.com/ap/signin}, response: fixture_body(:signin_post_response, ext: 'txt'))
  FakeWeb.register_uri(:get, %r{#{kindle_home_url}/authenticate/login_callback}, body: fixture_body(:kindle_home_page), content_type: "text/html")

  all_fixture_pages.each.with_index do |path, index|
    current_page_body = File.read(path)

    FakeWeb.register_uri(:get, "#{kindle_home_url}\/your_highlights", body: current_page_body, content_type: "text/html") if index == 0
    
    next_book_url = Nokogiri::HTML.parse(current_page_body).search("a[id='nextBookLink']/@href").to_s
    unless next_book_url.empty?
      next_book_body = fixture_body("highlights_page_#{index + 2}")
      FakeWeb.register_uri(:get, "#{kindle_home_url}#{next_book_url}", body: next_book_body, content_type: "text/html")
    end
  end
end

def all_fixture_pages
  Dir["#{TEST_ROOT}/fixtures/html/highlights_page_*.html"].sort
end

def fixture_body(filename, ext: 'html')
  File.read("#{TEST_ROOT}/fixtures/html/#{filename.to_s}.#{ext}")
end

mock_web_requests
