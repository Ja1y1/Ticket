class CreateTikts < ActiveRecord::Migration[7.1]
  def change
    create_table :tikts do |t|
      t.string :code

      t.timestamps
    end
  end
end
