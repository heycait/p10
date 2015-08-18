class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.boolean :rsvp, :default => false
      t.belongs_to :event

      t.timestamps
    end
    add_index :attendees, [:email, :event_id], :unique => true
  end
end
