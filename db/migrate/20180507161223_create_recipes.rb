class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :difficulty
      t.integer :serves
      t.integer :prepare_time
      t.integer :calories
      t.text :equipment
      t.text :ingredients
      t.text :directions
      t.text :photo

      t.timestamps
    end
  end
end
