class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :company
      t.string :website
      t.string :linkedin_account
      t.string :phone
      t.string :mobile
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
