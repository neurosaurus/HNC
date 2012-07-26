class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, :null => false
      t.integer :target_id, :null => false
      t.string  :target_type, :null => false
      t.integer :value, :null => false
      t.timestamps
    end

    add_index :votes, [:target_type, :target_id]
    add_index :votes, :user_id
  end
end
