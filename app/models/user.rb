# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :email, presence: true

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  # Self Association
  has_many :received_follows, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # enums
  enum account_type: { public_account: 0, private_account: 1 }
end
