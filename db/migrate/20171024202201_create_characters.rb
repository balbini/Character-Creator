class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.integer :ability_scores
      t.string :skill
      t.string :name
      t.integer :level
      t.integer :xp
      t.string :background
      t.string :equipment
      t.string :spell
      t.integer :speed
      t.integer :age
      t.string :alignment
      t.string :string
      t.string :race
      t.string :ideal
      t.string :bond
      t.string :flaw
      t.string :description
      t.integer :proficiency_bonus
      t.string :party_role
      t.integer :user_id
      t.integer :hit_points
      t.string :hit_die
      t.string :image

      t.timestamps
    end
  end
end
