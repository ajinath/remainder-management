class AddRenewDateToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :renew_date, :datetime
  end
end
