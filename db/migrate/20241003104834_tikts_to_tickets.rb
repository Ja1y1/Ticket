class TiktsToTickets < ActiveRecord::Migration[7.1]
  def change
    rename_table :tikts, :tickets
  end
end