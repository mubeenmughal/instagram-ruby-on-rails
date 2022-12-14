# frozen_string_literal: true

class Follow < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.timestamps
    end
  end
end
