require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    index = Nokogiri::HTML(html)
    student=[]
    #binding.pry
    index.css(".student-card a").each do |element|
      student_hash = {
        :name => element.css(".student-name").text,
        :location => element.css(".student-location").text,
        :profile_url => element.attribute("href").value}
      student << student_hash
      end
      #binding.pry
      student
  end


    
  

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    attributes = {}
   

    attributes [:profile_quote] = profile_page.css(".profile-quote").text
    attributes [:bio] = profile_page.css("div.description-holder p").text
    social_icon = profile_page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    
    #binding.pry
    social_icon.each do |atag|
      if atag.include? ("twitter")
        attributes[:twitter] = atag
      elsif atag.include? ("linkedin")
        attributes[:linkedin] = atag
      elsif atag.include? ("github")
        attributes[:github] = atag
      elsif atag.include? (".com")
        attributes[:blog] = atag
      end
    end
   attributes 
  end

end

