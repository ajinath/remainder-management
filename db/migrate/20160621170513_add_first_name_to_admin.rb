class AddFirstNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :mobile_no, :string
  end
end
