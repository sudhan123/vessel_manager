class CreateVoyages < ActiveRecord::Migration[6.1]
  def change
    create_table :voyages do |t|
      t.string :from
      t.string :to
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :vessel, null: false, foreign_key: true
      t.timestamps
    end
  end
end
