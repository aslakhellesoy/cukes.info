require 'bundler/setup'

class I18nExamplesGenerator
  attr_reader :languages
  
  def initialize
    require 'gherkin'
    require 'cucumber'
    @i18ndir = File.expand_path(File.join(Cucumber::LIBDIR, '../examples/i18n'))
  end
  
  def generate
    require 'erb'
    template = ERB.new(IO.read(File.dirname(__FILE__) + '/_includes/i18n_examples.erb'))
    File.open(File.dirname(__FILE__) + '/_includes/i18n_examples.html', "w") do |io|
      io.write(template.result(binding))
    end
  end

  def keyword_spans(i18n, key)
    %Q{<span class="keyword">} + i18n.keywords(key).join(%Q{</span>&nbsp;<span class="keyword">}) + %Q{</span>}
  end
  
  def example(lang)
    Dir["#{@i18ndir}/#{lang}/features/*feature"][0]
  end

  def pygmentize(lang)
    pygmentize = %{pygmentize -f html -O encoding=utf-8 "#{example(lang)}"}
    puts pygmentize
    `#{pygmentize}`
  end
end

desc 'Generate I18n Examples'
task :i18n_examples do
  I18nExamplesGenerator.new.generate
end

task :default => :i18n_examples