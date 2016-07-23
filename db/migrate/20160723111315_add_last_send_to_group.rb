class AddLastSendToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :last_send, :datetime
  end
end
