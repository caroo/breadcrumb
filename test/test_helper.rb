require "rubygems"
require 'stringio'
gem 'test-unit'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/breadcrumb'

require "action_controller"

class TestController < ActionController::Base
  include Breadcrumb::ControllerMethods
  
  def do_nothing
    render :nothing => true
  end
  
end

ActionController::Routing::Routes.draw do |map|  
  # Default connect for controllers and actions
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
end