class AddStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :string
    add_column :users, :status_message, :string
  end
end
