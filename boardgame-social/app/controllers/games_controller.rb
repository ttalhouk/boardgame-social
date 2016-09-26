class GamesController < ApplicationController
  before_action :find_user
  include CollectionUpdater
  def sync
    @user = User.find(params[:user_id])
    p 'in sync route'
    collection = CollectionUpdater.get_bgg_collection(@user)
    CollectionUpdater.add_to_collection(@user, collection)

    redirect_to user_games_path(@user)

  end

  def index
    @games = @user.games.order(:name).page(params[:page]).per_page(10)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

end
