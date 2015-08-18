class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :location   # <<< NOT SURE ABOUT THIS or how the data is coming in
      t.text :description
      t.decimal :cost
      t.belongs_to :user

      t.timestamps
    end
  end
end
