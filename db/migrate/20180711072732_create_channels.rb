class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer :onair, default: 0
      t.float :frequency, null: false
      t.integer :category, default: 0
      t.string :title

      t.timestamps null: false
    end
  end
end
