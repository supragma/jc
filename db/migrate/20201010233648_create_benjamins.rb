class CreateBenjamins < ActiveRecord::Migration[6.0]
  def change
    create_table :benjamins do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :left_id
      t.integer :right_id

      t.timestamps
    end
  end
end
