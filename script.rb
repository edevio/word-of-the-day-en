require 'open-uri'
require 'nokogiri'
require 'pry'

def get_jobs
    base_url = 'http://www.wordthink.com'
    data = data_scraper(base_url)

end

def data_scraper(url)
  Nokogiri::HTML(open(url))
end

puts get_jobs
