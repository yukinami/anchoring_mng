module ApplicationHelper
  def is_admin
      user = User.find_by_id(session[:user_id])
      if user and user.name == 'admin'
	return true
      else
	return false
      end
  end
end
