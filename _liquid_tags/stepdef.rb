module CukesInfo
  class StepdefTag < Liquid::Tag
    def render(context)
      %{<notextile><span class="java csharp">method</span><span class="groovy clj scala ioke">closure</span><span class="ruby">Proc</span><span class="js">function</span></notextile>}
    end
    Liquid::Template.register_tag('stepdef', self)
  end
end
