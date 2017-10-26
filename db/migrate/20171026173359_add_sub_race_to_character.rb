class AddSubRaceToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :subrace, :string
  end
end
