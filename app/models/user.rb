# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :story, dependent: :destroy
  has_one_attached :avatar

  has_many :received_follows, dependent: :destroy, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower

  validates :name, presence: true, length: { minimum: 5 }
  validates :email, presence: true

  enum account_type: { public_account: 0, private_account: 1 }

  def total_followers
    Follow.where(follower_id: id)
  end

  def total_following
    Follow.where(followed_id: id)
  end
end
