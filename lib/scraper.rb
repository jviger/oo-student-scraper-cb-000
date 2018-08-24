require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 
  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []
    page.css(".student-card").each do |block|
      student_name = block.css(".student-name").text
      student_location = block.css(".student-location").text
      student_profile_url = block.css("a").attr("href").value
      students << {name: student_name, location: student_location, profile_url: student_profile_url}
   
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    social = profile_page.css(".social-icon-container")
    social_links = []
    social_list = {}
    social.css("a").each {|x| social_test << x.attr("href")}
    
    social_list.each do |x| {
         if block.include?("linkedin")
            student_linkedin = x
         elsif  block.include?("github")
            student_github = x
         end
    }
  end
    
    student_blog = ""
    student_quote = ""
           social_list ={linkedin: student_linkedin, github: student_github, blog: student_blog, profile_quote: student_quote}
    
    #.each.attr("href").value do |block|

   
  end

end

