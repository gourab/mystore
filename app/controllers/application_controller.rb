class ApplicationController < ActionController::Base
  protect_from_forgery
  require File.join(Rails.root,'lib','authenticated_system.rb')
  include AuthenticatedSystem
end
