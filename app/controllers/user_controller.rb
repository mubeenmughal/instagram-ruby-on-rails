# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_permission, only: [:edit]

  def index

  end

  def new

  end

  def edit
    @user.avatar.attach(params[:avatar])
    authorize @user
  end

  # #show behave same with the user#profile
  # def profile
  #   @posts = current_user.posts
  # end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def search
    @user = User.where("name LIKE ?", "%" +params[:q] + "%")
    @follow_data = Follow.where(follower_id: current_user.id)
    @follow_data.each do|data|
      if @user.empty?
        false
      elsif data.followed_id == @user[0].id
        @already_followed = true
      else
      end
    end
  end

  # def search
  #   @user = User.where("name LIKE ?", "%" +params[:q] + "%")
  #   @follow_data = Follow.find_by(follower_id: current_user.id)
  #     if @user.empty?
  #       false
  #     elsif @follow_data.followed_id == @user.ids
  #       @already_followed = true
  #     else
  #     end
  # end




end
