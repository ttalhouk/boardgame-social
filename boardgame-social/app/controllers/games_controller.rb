require 'pp'
require 'will_paginate/array'
class GamesController < ApplicationController
  before_action :find_user, except: [:search, :result]
  include CollectionUpdater
  include BggSearch
  def sync
    @user = User.find(params[:user_id])
    p 'in sync route'
    collection = CollectionUpdater.get_bgg_collection(@user)
    CollectionUpdater.add_to_collection(@user, collection)

    redirect_to user_games_path(@user)

  end

  def search

  end

  def result
    search_term = search_params[:search]
    @games = BggSearch.search_bgg(search_term).paginate(:page => params[:page], :per_page => 30)
    pp @games
    respond_to do |format|
      format.html
      format.js
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
