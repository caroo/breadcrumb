module Breadcrumb
  module ControllerMethods
    module ClassMethods
      # This class method is a wrapper for a before_filter and the add_breadcrumb
      # method from above. Use it to add controller wide breadcrumbs or just to
      # list all breadcrumbs at the top of the file - in case you don't need any
      # dynamic values in the breadcrumb. 
      def add_breadcrumb(name, url, options = {})
        # before_filter Bread
        before_filter options do |controller|
          if options[:params] and options[:params].is_a?(Array)
            if controller.params[options[:params].first] and controller.params[options[:params].first] == options[:params].last
              controller.send(:add_breadcrumb, name, url)
            end
          else
            controller.send(:add_breadcrumb, name, url)
          end
        end
      end

      def reset_breadcrumbs
        before_filter do |controller|
          controller.send(:reset_breadcrumbs)
        end
      end
    end
    
    module InstanceMethods
      # The breadcrumb solution is copied from http://szeryf.wordpress.com/2008/06/13/easy-and-flexible-breadcrumbs-for-rails/

      # This method adds a new breadcrumb to the breadcrumbs list, which will be
      # used in the global layout for rendering the crumbs. It takes the name for
      # a breadcrumb and an optional url (same as in url_for).
      def add_breadcrumb(name, url = '')
        @breadcrumbs ||= []
        @breadcrumbs << [name, url]
      end

      def reset_breadcrumbs
        @breadcrumbs = nil
      end
    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end