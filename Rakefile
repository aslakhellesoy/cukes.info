class I18nExamplesGenerator
  attr_reader :languages
  
  def initialize
    require 'cucumber'
    @i18ndir = File.expand_path(File.join(Cucumber::LIBDIR, '../examples/i18n'))

    @languages = Cucumber::LANGUAGES.keys.sort
    @languages.unshift(@languages.delete('en'))
  end
  
  def generate
    require 'erb'
    template = ERB.new(IO.read(File.dirname(__FILE__) + '/_includes/i18n_examples.erb'))
    File.open(File.dirname(__FILE__) + '/_includes/i18n_examples.html', "w") do |io|
      io.write(template.result(binding))
    end
  end
  
  def keyword(lang, key)
    Cucumber::LANGUAGES[lang][key]
  end
  
  def example(lang)
    Dir["#{@i18ndir}/#{lang}/features/*feature"][0]
  end

  def pygmentize(lang)
    `pygmentize -f html -O encoding=utf-8 #{example(lang)}`
  end
end

desc 'Generate I18n Examples'
task :i18n_examples do
  I18nExamplesGenerator.new.generate
end
