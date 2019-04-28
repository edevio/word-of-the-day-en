require 'open-uri'
require 'nokogiri'
require 'pry'
require 'csv'

def get_jobs
    base_url = 'http://www.wordthink.com'
    data = data_scraper(base_url)
    cards = []
    all_sections = data.css('.category-daily-word')

    all_sections.each_with_index do| section, section_index|

      cards << {
                title: section.css('.title > a').text,
                description: section.css('p').text
              }
    end

    write_csv(cards)

end

def data_scraper(url)
  Nokogiri::HTML(open(url))
end

def write_csv(cards)
  CSV.open("latest_cards.csv", "w") do |csv|
    csv << ["back", "front"]
    cards.each do | card|
    csv << [card[:title], card[:description]]
    end
  end
end

get_jobs
