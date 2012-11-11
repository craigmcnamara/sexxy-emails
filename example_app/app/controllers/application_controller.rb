class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render :text => "Sexxy emails example app."
  end
end
