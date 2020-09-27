require 'open-uri'
require 'pry'
require 'nokogiri' 
require_relative './student.rb' 

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    binding.pry 
    # doc.css(".main-wrapper").first.css("h1").text
    # doc.css(".main-wrapper").first.css("h2").text
    # doc.css(".roster-cards-container").first
    # doc.css(".student-card").first

  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/students/joe-burgess.html"))
  end

end
