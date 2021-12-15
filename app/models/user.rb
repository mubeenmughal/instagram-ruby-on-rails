# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

   has_many :likes, dependent: :destroy
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_one_attached :avatar

   # Self Association
   has_many :received_follows, foreign_key: :followed_id, class_name: 'Follow'
   has_many :followers, through: :received_follows, source: :follower

  validates :name, presence: true, length: { minimum: 5 }
  validates :email, presence: true

 # enums
  enum account_type: { public_account: 0, private_account: 1 }

  def total_followers
    Follow.where(follower_id: self.id)
  end

  def total_following
    Follow.where(followed_id: self.id)
  end
end
