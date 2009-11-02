require "test_helper"

module Breadcrumb
  class ViewHelperTest < Test::Unit::TestCase
    include Breadcrumb::ViewHelper
    
    # Add other helpers here if you need them
    include ::ActionView::Helpers::TagHelper
    include ::ActionView::Helpers::UrlHelper
    include ::ActionView::Helpers::TextHelper
    
    def test_should_render_breadcrumbs
      @breadcrumbs = [['aname', 'alink'], ['second_name','second_link']]
      output = render_breadcrumbs
      assert_match(/aname/, output)
      assert_match(/alink/, output)
      assert_match(/second_name/, output)

      # The last breadcrumb should not rendered as a link
      assert_no_match(/second_link/, output)
    end
    
  end
end