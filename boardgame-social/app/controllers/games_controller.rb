require 'pp'
require 'will_paginate/array'
class GamesController < ApplicationController
  before_action :find_user, except: [:search, :result]
  include CollectionUpdater
  include BggSearch
  def sync
    collection = CollectionUpdater.get_bgg_collection(@user)
    CollectionUpdater.sync_collection(@user, collection)
    redirect_to user_games_path(@user)
  end

  def add
    game_data = BggSearch.get_game_info(params[:game_id])
    @game = CollectionUpdater.add_to_collection(@user, game_data['item'][0])
    if @game.errors.empty?
      flash[:success] = "Game Added Successfully"
      redirect_to user_games_path(@user)
    else
      flash[:error] = "Unable to add Game"
      redirect_to games_search_path
    end
  end

  def search

  end

  def result
    search_term = search_params[:search]
    @games = BggSearch.search_bgg(search_term).paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def remove
    if @user == current_user
      @game = @user.games.find(params[:game_id])
      if @game
        @user.games.delete(@game)
      end
      respond_to do |format|
        format.html
        format.js
      end
    else
      redirect_to user_games_path(current_user)
    end
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

  def search_params
    params.permit(:search, :page)
  end
end
