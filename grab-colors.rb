require 'nokogiri'
require 'pp'

color_lisa_html = File.open("color-lisa.html") { | f | Nokogiri::HTML(f) }

paintings = Array.new
colors_1 = Array.new
colors_2 = Array.new
colors_3 = Array.new
colors_4 = Array.new
colors_5 = Array.new

color_lisa_html.css('div.artist__item').each do | artist_item |
	title  = artist_item.css('div.palette h3.palette__author a strong').text.strip
	if title.empty?
		next
	end
	artist = artist_item.css('div.palette h3.palette__author').text.split("by")[1].strip
	colors       = Array.new
	artist_item.css('div.palette div.palette__content li').each do | color_li |
		colors << color_li.text.strip
	end
	paintings << '"' + "#{title} by #{artist}" + '"'
    colors_1 << '"' + colors[0] + '"'
    colors_2 << '"' + colors[1] + '"'
    colors_3 << '"' + colors[2] + '"'
    colors_4 << '"' + colors[3] + '"'
    colors_5 << '"' + colors[4] + '"'
end

print "color.pals <- data.frame("
print "painting <- c(#{paintings * ', '}),\r"
print "  color_1  <- c(#{colors_1 * ', '}),\r"
print "  color_2  <- c(#{colors_2 * ', '}),\r"
print "  color_3  <- c(#{colors_3 * ', '}),\r"
print "  color_4  <- c(#{colors_4 * ', '}),\r"
print "  color_5  <- c(#{colors_5 * ', '}))"

# End of script
