require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
   doc = Nokogiri::HTML(open(index_url))
   student_hash = {}
   scraped_students = []
   doc.css(".student-card a").each do |student|
     student_hash = {:name => student.css("h4.student-name").text,
     :location => student.css("p.student-location").text,
    :profile_url => student.attribute("href").value
     }
   scraped_students << student_hash 
  end
   scraped_students
  end

 
  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(index_url))
    student_profile_hash = {}
    doc.css(".main-wrapper profile a").each do |profile|
      student_profile_hash = {
  end





end

