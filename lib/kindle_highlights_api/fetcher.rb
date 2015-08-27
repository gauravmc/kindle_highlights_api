require 'mechanize'
require 'logger'

module KindleHighlightsAPI
  class Fetcher
    class LoginError < StandardError; end

    def initialize(email, password)
      @email, @password = email, password
      login_to_amazon_kindle
    end

    def fetch_all
      Array.new.tap do |books|
        fetch_each do |book|
          books << book
        end
      end
    end

    def fetch_each
      book_page = @highlights_page.link(href: "/your_highlights").click

      while next_book_link = book_page.link(id: 'nextBookLink') do
        yield Book.from_page(book_page)
        book_page = next_book_link.click
      end
    end

    private

    def login_to_amazon_kindle
      page = agent.get("https://kindle.amazon.com/login")
      code = check_for_captchas(page)
      page = submit_form(page, code: code)

      # Sometimes Amazon wants you to do captcha input twice
      if code = check_for_captchas(page)
        page = submit_form(page, code: code)
      end

      if page.form_with(name: 'signIn')
        raise LoginError, "Unable to log into Amazon Kindle"
      else
        @highlights_page = page
      end
    end

    def submit_form(page, code: nil)
      form = page.form_with(name: 'signIn')
      form.email = @email
      form.password = @password
      form.guess = code if code
      form.submit
    end

    def check_for_captchas(page)
      if page.link_with(href: /captcha/) && page.image_with(src: /captcha/)
        puts "Captcha image: #{page.image_with(src: /captcha/).src}\n"
        puts "Type captcha code: "
        captcha_code = gets.strip
        captcha_code
      end
    end

    def agent
      @agent ||= Mechanize.new do |a|
        a.user_agent_alias = 'Mac Safari'
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
        a.open_timeout = 10
        a.read_timeout = 10
      end
    end
  end
end
