class PagesController < ApplicationController
  def home
  end

  def my_photos
  	@photo = Card.where("user_id = ?",current_user.id).paginate(:page => params[:page])
		
  end
end
