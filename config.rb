###
# Blog settings
###

Time.zone = "Beijing"

activate :blog do |blog|
  # blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layouts/article"
  # blog.summary_separator = /(READMORE)/
  blog.summary_length = 800
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

page "feed.xml", :layout => false
#page "sitemap.xml", :layout => false

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
::Compass.configuration do |compass|
  # config.output_style = :compact
  ::Sass.load_paths.concat(compass.sass_load_paths)
end

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

activate :syntax

# Methods defined in the helpers block are available in templates
helpers do
  def disqus_identifier(article)
    article.data["disqus_identifier"] || article.title.parameterize
  end

  def nav_li(href, title)
    if current_path == href || (current_path == "index.html" && href == "")
      "<li class='active'><a href='/#{href}'>#{title}</a></li>"
    else
      "<li><a href='/#{href}'>#{title}</a></li>"
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, autolink: true, smartypants: true, footnotes: true, strikethrough: true

# Livereload
# use: https://github.com/middleman/middleman-livereload
activate :livereload

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = "master"
end
