class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.text :content
      t.integer :read, default: 0

      t.timestamps null: false
    end
  end
end
