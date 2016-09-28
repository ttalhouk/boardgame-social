require 'pp'
require 'will_paginate/array'

class UsersController < ApplicationController

  def search

  end

  def result
    search_term = search_params[:search]
    @users = User.where("bgg_username ILIKE (?)", "%#{search_term}%").order(:bgg_username).paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.js
    end
  end


  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash.now[:alert] = "User Not Found"
      redirect_to users_path
    end
  end

  private

  def search_params
    params.permit(:search, :page)
  end
end
