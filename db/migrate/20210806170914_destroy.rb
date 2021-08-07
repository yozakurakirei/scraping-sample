class Destroy < ActiveRecord::Migration[6.1]
  def change
    drop_table :culcs
  end
end
