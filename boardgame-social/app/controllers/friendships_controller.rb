
class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Unable to add friend. " + @friendship.errors.full_messages[0]
      redirect_to users_search_path
    end
  end

  def destroy
    @user = current_user
    @friend = User.find(params[:friend])

    if params[:inverse] == "true"
      friendship = @user.inverse_friends.delete(@friend)
    else
      friendship = @user.friends.delete(@friend)
    end
    p friendship
    if friendship
      flash[:notice] = "Removed friendship."
    end
    redirect_to user_path(current_user)
  end
end
