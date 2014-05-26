class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :sub_category
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
