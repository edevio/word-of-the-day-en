require 'open-uri'
require 'nokogiri'
require 'pry'

def get_jobs
    base_url = 'http://www.wordthink.com'
    data = data_scraper(base_url)
    title = []
    all_sections = data.css('.category-daily-word')

    all_sections.each_with_index do| section, section_index|

      title << {
                title: section.css('.title > a').text,
                description: section.css('p').text
              }
    end

    print(title)

end

def data_scraper(url)
  Nokogiri::HTML(open(url))
end

get_jobs
