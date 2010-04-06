module Breadcrumb
  module ViewHelper
    
    def render_breadcrumbs
      crumbs = []
      if @breadcrumbs && !@breadcrumbs.empty?
        @breadcrumbs[0..-2].each do |txt, path|
          crumbs << "<li>#{link_to(h(txt), path)}</li>"
        end
        crumbs << "<li class=\"current\"><span>#{h(@breadcrumbs.last.first)}</span></li>"
      end
      return crumbs.to_s
    end
  end
end