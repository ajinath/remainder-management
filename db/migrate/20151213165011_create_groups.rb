class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.date :start_date
      t.string :time_stamp
      t.integer :interval
      t.boolean :status, default: true
      t.string :members, array: true, default: '{}'
      
      t.references :template, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
