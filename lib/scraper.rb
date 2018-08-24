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
    social_list = {:linkedin => "", :github => "", :blog => "", :profile_quote => "", :bio => "", :twitter => ""}
    social.css("a").each {|x| social_links << x.attr("href")}
    
    student_blog = nil
    student_quote = nil
    student_linkedin = nil
    student_github = nil
    student_twitter = nil
    student_bio = nil
    
     quote = profile_page.css(".profile-quote").text
     if quote
       student_quote = quote.strip
     end
     bio = profile_page.css(".bio-content div.description-holder").text
     if bio 
       student_bio = bio.strip
     end
   
     social_links.each do |x| 
             if x.include?("linkedin.com")
                student_linkedin = x
             elsif x.include?("github.com")
                student_github = x
             elsif x.include?("twitter.com")
                student_twitter = x 
              else student_blog = x
             end
      end
      
           social_list[:linkedin] = student_linkedin
           social_list[:github] = student_github
           social_list[:blog] = student_blog
           social_list[:profile_quote] = student_quote
           social_list[:twitter] = student_twitter
           social_list[:bio] = student_bio
    
    social_list.delete_if { |x, y| y.nil? }
    
 
       
       
  end

end

