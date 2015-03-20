class PlayerAddNewCloumnRating < ActiveRecord::Migration
  def change

    add_column :players, :rating, :float, default: 0

  end
end
