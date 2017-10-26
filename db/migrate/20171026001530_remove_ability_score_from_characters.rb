class RemoveAbilityScoreFromCharacters < ActiveRecord::Migration[5.1]
  def change
    remove_column :characters, :ability_scores, :integer
  end
end
