# frozen_string_literal: true

class Likes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
