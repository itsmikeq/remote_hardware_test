class HomeController < ApplicationController
  def index
    # @users = User.all
    if current_user.nil?
      render "content"
    else
      @devices = current_user.company.devices unless current_user.company.nil?
      @uploads = Upload.where("company_id = ? ",current_user.company_id) unless current_user.company.nil?
    end
  end
end
