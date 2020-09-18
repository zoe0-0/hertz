class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.integer :max_audience, default: 0
      t.text :content
      t.datetime :finished_at   #방송종료시간
      t.references :channel, index: true, foreign_key: true
      t.string :title
      #t.integer :index, null: false, default: 0  #몇번째 다이어리인지
      t.timestamps null: false
    end
  end
end
