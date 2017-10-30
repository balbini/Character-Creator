class AddCharactertoParty < ActiveRecord::Migration[5.1]
  def change
    create_table :AddCharactertoParty do |t|
      t.integer :party_id
    end
  end
end
