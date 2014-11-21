class AddXturnToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :is_xturn, :boolean
  end
end
