class CreateResizers < ActiveRecord::Migration
  def change
    create_table :resizers do |t|
      t.string :image_dimensions
      t.string :bounding_box

      t.timestamps null: false
    end
  end
end
