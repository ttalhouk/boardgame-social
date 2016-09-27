module GamesHelper
  def current_user_page
    params[:user_id].to_i == current_user.id
  end
end
