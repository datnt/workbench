class CreatePaypalNotifications < ActiveRecord::Migration
  def change
    create_table :paypal_notifications do |t|
      t.text :params
      t.string :txn_id
      t.string :payer_id
      t.string :txn_type

      t.timestamps
    end
  end
end
