class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.references :administrator, index: true #table au pluriel donc plusieurs events sont referent de plusieurs admins

      t.timestamps
    end
  end
end
