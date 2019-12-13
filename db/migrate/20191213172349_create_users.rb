class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :rank
      t.integer :level

      t.timestamps
    end
  end
end
