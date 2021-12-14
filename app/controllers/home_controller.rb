# frozen_string_literal: true

class HomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
