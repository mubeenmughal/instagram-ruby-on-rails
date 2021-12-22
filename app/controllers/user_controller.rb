# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user.avatar.attach(params[:avatar])
    authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def search
    @user = User.where("name LIKE ?", "%" +params[:q] + "%")
    @user1 = User.where.not(id: current_user.id)
  end
end
