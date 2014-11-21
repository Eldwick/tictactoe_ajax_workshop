class ChangeXturnDefaultToBoard < ActiveRecord::Migration
  def change
    change_column :boards, :is_xturn, :boolean, default: true
  end
end
