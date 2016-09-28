module UsersHelper
  def current_user_page
    params[:id].to_i == current_user.id
  end
end
