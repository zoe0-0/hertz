class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.references :channel, index: true, foreign_key: true
      t.datetime :start, null: false
      t.datetime :end, null: false

      t.timestamps null: false
    end
  end
end
