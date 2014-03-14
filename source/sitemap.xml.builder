require 'time'

xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path =~ /\.html/ }.each do |page|
    lastmod = Date.today.to_time.iso8601
    priority = page.data.priorty
    unless priority
      if page.path =~ /[0-9]{4}-[0-9]{2}-[0-9]{2}-.*.html$/
        priority = "1"
        lastmod = File.mtime("source/#{page.path}.markdown").iso8601
      elsif page.path =~ /^tags\//
        priority = "0.9"
      else
        priority = "0.8"
      end
    end
    xml.url do
      xml.loc "#{data.sitemap.url}#{page.url}"
      xml.lastmod lastmod
      xml.changefreq page.data.changefreq || "weekly"
      xml.priority priority
    end
  end
end
