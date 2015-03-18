class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :login
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
