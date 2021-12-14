# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:profile]

  def index
    @follower_suggestions = User.where.not(id: current_user)
  end

  def new

  end

  def edit
    @user.avatar.attach(params[:avatar])
  end

  def show
  end

  def profile
    @posts = current_user.posts
  end


  def set_account
    @user = User.find_by_name(params[:name])
  end
end
