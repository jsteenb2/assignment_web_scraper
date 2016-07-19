require 'rubygems'
require 'bundler/setup'
require 'mechanize'


# agent = Mechanize.new
# page = agent.get('http://www.dice.com')


a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

# a.get('http://www.dice.com') do |page|
#   search_result = page.form_with(:id => 'search-form') do |form|
#     form.q = 'rails developer'
#     form.l = 'Orange County, Ca'
#   end.submit
#
#
#  pp search_result.links_with(:text => /Full Stack/)
# end

# a.get('https://www.dice.com/jobs/advancedSearch.html') do |page|
#   search_result = page.form_with(:id => 'ajs') do |form|
#     # form.for_all = 'Full Stack'
#     form.for_jt = 'Rails developer'
#     form.for_loc = 'Orange County, CA'
#     form.field_with(:id => 'radius') = '30 miles'
#     form.radiobuttons_with(:name => 'sort')[0].check
#   end.submit

#   puts search_result.class
#  # pp search_result.dlinks.map(&:text).map(&:strip)
# end

  # search_result = page.form_with(:id => "search-field-keyword") do |search|
  #   search.q = 'rails developer'
  # end.submit


a.get('https://www.dice.com/jobs?q=&l=') do |page|
  search_result = page.form_with(:id => "searchJob") do |form|
    form.q = "rails developer"
    form.l = "Orange County, CA"
    # form.radius = '40'
  end.submit

  # pp search_result.links_with(:class => 'dice-btn-link')#to_css('a.dice-btn-link')

  # pp search_result.search('#serp h3 a').text.split(/\n\t/).map(&:strip).select{|item| !item.empty?} # gives us job Title

  pp search_result.links_with(:id => /\d+/)

  

  # search_result.search('#serp h3 a').links.each do |link|
  #   text = link.text.strip
  #   next unless text.length > 0
  #   puts text
  # end
end
