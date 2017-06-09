class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :category
      t.integer :price
      t.string :title
      t.integer :inventory

      t.timestamps null: false
    end
  end
end
