class AddStateToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      add_column :posts, :state, :string
    end
  end
end
