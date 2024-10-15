class CreateTkts < ActiveRecord::Migration[7.1]
  def change
    create_table :tkts do |t|
      t.string :code
      t.string :String

      t.timestamps
    end
  end
end
