module Breadcrumb
  module ViewHelper
    
    def render_breadcrumbs
      crumbs = []
      if @breadcrumbs && !@breadcrumbs.empty?
        @breadcrumbs[0..-2].each do |txt, path|
          crumbs << content_tag(:li) do
            link_to(content_tag(:span, h(txt)), path)
          end
        end
        crumbs << content_tag(:li, :class => :current) do
          content_tag :span, h(@breadcrumbs.last.first)
        end
      end
      return crumbs.blank? ? "" : content_tag(:ul, crumbs.to_s, :id => :breadcrumb)
    end
  end
end