class ApplicationController < ActionController::Base
  protect_from_forgery
  helper BackfireRails::Engine.helpers
end
