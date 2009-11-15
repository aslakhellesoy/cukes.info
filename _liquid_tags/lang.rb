module CukesInfo
  class LangTag < Liquid::Tag
    def render(context)
      %{<notextile><span class="ruby">Ruby</span><span class="java">Java</span><span class="scala">Scala</span><span class="csharp">C#</span><span class="groovy">Groovy</span><span class="clojure">Clojure</span><span class="js">Javascript</span><span class="ik">Ioke</span></notextile>}
    end
    Liquid::Template.register_tag('lang', self)
  end
end
