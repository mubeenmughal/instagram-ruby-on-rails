# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new

  end

  def edit
    @user.avatar.attach(params[:avatar])
  end

  def show
    @posts = current_user.posts
  end
end
