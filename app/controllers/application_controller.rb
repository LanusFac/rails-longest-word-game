class ApplicationController < ActionController::Base
  def score
    session[:score] = 0
  end
end
