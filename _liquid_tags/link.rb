module Jekyll
  class Page
    attr_reader :dir
  end
end

module CukesInfo
  class LinkTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @page_name = markup.strip
      super
    end

    def render(context)
      site = context.registers[:site]
      source = File.expand_path(site.source)
      pages = Dir["#{source}/**/*.textile"].reject{|f| f =~ /_site|_posts/}.map do |f|
        full_dir = File.dirname(File.expand_path(f))
        dir = full_dir[source.length+1..-1] || ""
        page = Jekyll::Page.new(site, source, dir, File.basename(f))
      end
      pages = pages.select do |p|
        p.data['title'] == @page_name
      end
      raise "Found #{pages.length} pages with title #{@page_name.inspect}" if pages.length != 1
      
      dir = "/" + pages[0].dir
      dir += "/" unless dir == "/"
      
      %{<a href="#{dir}#{pages[0].basename}.html">#{@page_name}</a>}
    end
    Liquid::Template.register_tag('link', self)
  end
end
