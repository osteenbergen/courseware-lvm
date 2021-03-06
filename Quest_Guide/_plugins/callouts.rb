class Tip < Liquid::Block
    def render(context)
        "<div class = \"lvm-callout lvm-tip\"><p>#{super}</p></div></div>"
    end
end

class Warning < Liquid::Block
    def render(context)
        "<div class = \"lvm-callout lvm-warning\"><p>#{super}</p></div></div>"
    end
end

class Fact < Liquid::Block
    def render(context)
        "<div class = \"lvm-callout lvm-fact\"><p>#{super}</p></div></div>"
    end
end

module Jekyll
  class Aside < Liquid::Block
    include Jekyll::Filters
    def initialize(tag_name, markup, tokens)
      super
      @title = markup
    end
    def render(context)
      @context = context
      "<div class = \"lvm-inline-aside\"><h4>#{@title}</h4><p>#{markdownify(super)}</p></div></div>"
    end
  end
end

class Figure < Liquid::Tag
  def initialize(tag_name, text, tokens)
     super
     @src = text
  end
    def render(context)
        "<div class = \"img-wrapper\"><img src=#{@src}/><p>Figure</p></div>"
    end
end

Liquid::Template.register_tag('tip', Tip)
Liquid::Template.register_tag('warning', Warning)
Liquid::Template.register_tag('fact', Fact)
Liquid::Template.register_tag('aside', Jekyll::Aside)
Liquid::Template.register_tag('figure', Figure)
