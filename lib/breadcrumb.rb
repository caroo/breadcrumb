$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require File.join(File.dirname(__FILE__), "breadcrumb", "view_helper")
require File.join(File.dirname(__FILE__), "breadcrumb", "controller_methods")

require "action_view"


module Breadcrumb
  VERSION = '0.2.0'
end