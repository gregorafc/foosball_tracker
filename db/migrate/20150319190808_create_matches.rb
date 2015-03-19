class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :match_date
      t.belongs_to :home_player, index: true
      t.belongs_to :away_player, index: true
      t.boolean :home_player_win
      t.integer :looser_score

      t.timestamps null: false
    end
  end
end
