require 'mechanize'

module KindleHighlightsAPI
  class Fetcher
    def initialize(email, password)
      @email, @password = email, password
    end

    def fetch_all
      Array.new.tap do |books|
        fetch_each do |book|
          books << book
        end
      end
    end

    def fetch_each
      page = get_highlights_page

      while next_book_link = page.link(id: 'nextBookLink') do
        yield Book.from_page(page)
        page = next_book_link.click
      end
    end

    private

    def get_highlights_page
      kindle_home_page = login_to_amazon_kindle
      kindle_home_page.link(href: "/your_highlights").click
    end

    def login_to_amazon_kindle
      login_page = agent.get("https://kindle.amazon.com/login")

      login_page.form_with(name: 'signIn') do |form|
        form['email'] = @email
        form['password'] = @password
      end.submit
    end

    def agent
      @agent ||= Mechanize.new do |a|
        a.user_agent = 'Individueller User-Agent'
        a.user_agent_alias = 'Mac Safari'
        a.open_timeout = 10
        a.read_timeout = 10
        a.ssl_version = 'SSLv3'
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end
  end
end
