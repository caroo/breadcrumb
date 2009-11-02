module Breadcrumb
  module ViewHelper
    
    def render_breadcrumbs
      crumbs = []
      if @breadcrumbs && !@breadcrumbs.empty?
        @breadcrumbs[0..-2].each do |txt, path|
          crumbs << link_to(h(txt), path)
        end
        crumbs << "<span>#{h(@breadcrumbs.last.first)}</span>"
      end
      return "#{crumbs.join(' » ')}" unless crumbs.empty?
    end
  end
end