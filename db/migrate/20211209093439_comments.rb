# frozen_string_literal: true

class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.string :description, null: false, default: ''
      t.timestamps
    end
  end
end
