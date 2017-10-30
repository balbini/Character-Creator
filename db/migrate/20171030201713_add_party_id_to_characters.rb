class AddPartyIdToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :party_id, :integer 
  end
end
