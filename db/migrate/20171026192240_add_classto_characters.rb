class AddClasstoCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :class, :string
  end
end
