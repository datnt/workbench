class CreatePaypalProfiles < ActiveRecord::Migration
  def change
    create_table :paypal_profiles do |t|
      t.string :profile_id

      t.timestamps
    end
  end
end
