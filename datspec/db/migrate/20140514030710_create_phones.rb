class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.belongs_to :contact
      t.string :phone_type
      t.string :phone
      t.timestamps
    end
  end
end
