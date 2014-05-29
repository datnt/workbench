class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts, :force => true do |t|
      t.string   "firstname"
      t.string   "lastname"
      t.string   "email"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false

      t.timestamps
    end
  end
end
