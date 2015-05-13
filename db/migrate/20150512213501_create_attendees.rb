class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.name :name
      t.string :email
      t.timestamps
    end
  end
end
