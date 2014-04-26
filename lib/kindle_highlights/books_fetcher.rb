require 'mechanize'

module KindleHighlights
  class BooksFetcher
    def initialize(email, password)
      @email, @password = email, password
    end

    def fetch
    end

    private

    def agent
      @agent ||= Mechanize.new do |a|
        a.user_agent = 'Individueller User-Agent'
        a.user_agent_alias = 'Mac Safari'
        a.open_timeout = 3
        a.read_timeout = 4
        a.ssl_version = 'SSLv3'
        a.verify_mode = OpenSSL::SSL::VERIFY_NONE
        a.log = Logger.new(STDOUT)
      end
    end
  end
end
