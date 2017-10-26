class CreateCharacterClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :character_classes do |t|
      t.string :name
      t.integer :hit_die
      t.string :proficiency_choices
      t.string :proficiences
      t.string :saving_throws
      t.string :features
      t.string :subclasses

      t.timestamps
    end
  end
end
