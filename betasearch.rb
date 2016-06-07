require 'nokogiri'
require 'open-uri'

puts "Enter google search"
google_search = gets
puts "How many results? Results will be given in multiples of ten"
$google_amount_link_total = gets.to_i
$google_amount_link_start = 0
$google_amount_per_page = 10

until $google_amount_link_start >= $google_amount_link_total  do
    #parse data in google to URL
    html_data = open("http://www.google.com/search?q=#{google_search}&num=#$google_amount_per_page&start=#$google_amount_link_start").read
    nokogiri_object = Nokogiri::HTML(html_data)
    search_elements = nokogiri_object.xpath("//h3[@class='r']/a/@href")
    search_elements.each do |search_element|
        puts search_element.text.gsub(/\/url?q=|&sa=.*/, '')
    end
   $google_amount_link_start +=$google_amount_per_page;
   if $google_amount_link_total > 10
       sleep(4.6)
   end
end
