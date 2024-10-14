class PagesController < ApplicationController

  skip_before_action :expiration
  def home
  end
end
