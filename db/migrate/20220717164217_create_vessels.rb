class CreateVessels < ActiveRecord::Migration[6.1]
  def change
    create_table :vessels do |t|
      t.string :name
      t.string :owner_id
      t.string :naccs_code

      t.timestamps
    end
    add_index :vessels, :naccs_code, unique: true
  end
end
