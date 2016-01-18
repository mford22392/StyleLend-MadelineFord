class CreateResizers < ActiveRecord::Migration
  def change
    create_table :resizers do |t|
      t.text :image_dimensions, array: true
      t.text :bounding_box, array: true

      t.timestamps null: false
    end
  end
end
