class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :party_members
      t.integer :user_id

      t.timestamps
    end
  end
end
