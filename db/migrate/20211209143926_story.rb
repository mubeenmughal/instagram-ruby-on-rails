# frozen_string_literal: true

class Story < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.references :user
      t.string :description
      t.timestamps
    end
  end
end
