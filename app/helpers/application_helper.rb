# -*- encoding : utf-8 -*-
module ApplicationHelper
  def allowed_to_user?(user)
    user_signed_in? ? current_user == user : false    
  end
end
