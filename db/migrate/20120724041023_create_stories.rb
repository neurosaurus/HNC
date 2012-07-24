class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :link
      t.string :title
      t.text :body
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
