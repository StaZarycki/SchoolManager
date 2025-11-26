class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @classes = current_user.classes
  end
end
