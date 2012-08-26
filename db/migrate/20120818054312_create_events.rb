class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.text :name, null: false
      t.references :venue
      t.decimal :price, precision: 8, scale: 2
      t.datetime :start_time
      t.datetime :end_time
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
