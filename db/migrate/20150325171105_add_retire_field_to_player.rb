class AddRetireFieldToPlayer < ActiveRecord::Migration
  def change

    add_column :players, :retire, :boolean, default: false

  end
end
