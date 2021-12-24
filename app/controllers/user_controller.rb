# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission, only: %i[show edit]

  def edit
    @user.avatar.attach(params[:avatar])
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @user = User.where('name LIKE ?', "%#{params[:q]}%")
    @user1 = User.where.not(id: current_user.id)
  end

  def check_permission
    authorize User
  end
end
