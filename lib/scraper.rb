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
    social_test = social.css("a")
    #.each.attr("href").value do |block|
  #    if block.include?("linkedin")
   #     student_linkedin = block.attr("href").value
    #  elsif  block.include?("github")
    #   student_github = block.attr("href").value
    #  end
    #  student_blog = ""
    #  student_profile_quote = ""
    #  student_bio = ""
  #end
     
    binding.pry
  end

end

