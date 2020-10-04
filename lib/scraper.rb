require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/"
    page = Nokogiri::HTML(open(index_url))
    students = []

    page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {
          :name => name,
          :location => location,
          :profile_url => profile_url
       }
      students << student_info
      end
     students
   end


   def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    student = {}
    
    links = doc.css(".social-icon-container").children.css("a").map {|el| el.attribute('href').value}
    
    links.each do |link|
      
      if link.include?("twitter")
        student[:twitter] = link 
       elsif
         link.include?("linkedin")
          student[:linkedin] = link
       elsif 
        link.include?("github")
          student[:github] = link 
       else 
          link.include?("blog")
          student[:blog] = link 
       end 
     end
    
        student[:profile_quote] = doc.css(".profile-quote").text if doc.css(".profile-quote")
        student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p").text if doc.css("div.bio-content.content-holder div.description-holder p").text
        student
     end 

end 

