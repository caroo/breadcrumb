require "test_helper"

module Breadcrumb
  class ControllerMethodsTest < ActionController::TestCase
    
    def setup
      @controller = TestController.new
    end
    
    def test_should_add_a_breadcrumb_from_object_context
      assert @controller.send('add_breadcrumb', "crumb_name", 'some_parameter')
      assert crumbs = @controller.instance_variable_get('@breadcrumbs')
      assert_kind_of(Array, crumbs)
      assert_equal(1, crumbs.size)
      assert_kind_of(Array, inserted_crumb = crumbs.first)
      assert_equal('crumb_name', inserted_crumb.first)
      assert_equal('some_parameter', inserted_crumb.last)
    end
    
    def test_should_have_add_breadcrumb_class_methods
      
      # instance_methods in the context of a Class returns the CLASS methods!!!
      assert TestController.instance_methods.include?('add_breadcrumb')
      
      # Fire just any action to run the before_filter in the static add_breadcrumb method
      get :do_nothing
      assert_response :success, @response.body
      assert_false @controller.instance_variable_defined? '@breadcrumbs'
    end
    
    def test_should_render_breadcrumbs_in_correct_order
      assert TestController.send('add_breadcrumb', 'crumb_static', 'some_parameter')
      
      get :do_nothing
      assert_response :success, @response.body
      
      assert @controller.send('add_breadcrumb', "crumb_dynamic", 'some_parameter')
      assert crumbs = @controller.instance_variable_get('@breadcrumbs')

      assert_kind_of(Array, crumbs)
      assert_equal(2, crumbs.size, "There should be 2 breadcrumbs: The default one(Startseite) and the 2 testing crumbs.\ncrumbs: #{crumbs.inspect}")

      assert_kind_of(Array, inserted_crumb = crumbs.first)
      assert_equal('crumb_static', inserted_crumb.first)
      assert_equal('some_parameter', inserted_crumb.last)

      assert_kind_of(Array, inserted_crumb = crumbs[1])
      assert_equal('crumb_dynamic', inserted_crumb.first)
      assert_equal('some_parameter', inserted_crumb.last)
    end
    
  end
end