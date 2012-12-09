###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

helpers do
  def link(label, url=nil)
    options = {}
    options = { :target => '_blank' } if url =~ /^https?:/
      
    link_to label, url || "/#{label.downcase.gsub(" ", "_")}.html", options
  end

  def sub_link(parent, label, url=nil)
    options = {}
    options = { :target => '_blank' } if url =~ /^https?:/
      
    link_to label, url || "/#{parent.downcase.gsub(" ", "_")}_#{label.downcase.gsub(" ", "_")}/", options
  end

  def image_tag(url, options = {})
    html =  "<img src=\"/images/#{url}\" "  
    html += options[:title] ? "title=\"#{options[:title]}\" " : ""
    html += options[:alt] ? "alt=\"#{options[:alt]}\"" : ""
    html += "/>"
    html
  end

  def stylesheet_link_tag(*sources)
    content = []
    sources.each do |source|
      content << %Q(<link rel="stylesheet" type="text/css" href="/stylesheets/#{source}.css" media="screen">)
    end
    content.join("\n")
  end

  def vagrant(image)
    url = "http://files.vagrantup.com/#{image}"
    link url, url
  end

  def b(s)
    "<b>#{s}</b>"
  end
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end